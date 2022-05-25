//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func dismiss()
    func changeWeather(weatherUIData: WeatherUIData)
    func showErrorAlert(message: String)
}

final class ViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    private var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        self.presenter?.closeAction()
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        self.presenter?.reloadAction()
    }
}

extension ViewController {
    static func instantiate() -> ViewController {
        guard let initialVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else {
            fatalError("VCが見つかりませんでした。")
        }
        return initialVC
    }
}

extension ViewController: MainViewProtocol {
    func dismiss() {
        self.dismiss(animated: true)
    }
    
    func showErrorAlert(message: String) {
        let alert = ErrorAlertBuilder.build(message: message)
        self.present(alert, animated: true)
    }
    
    func changeWeather(weatherUIData: WeatherUIData) {
        self.weatherImageView.image = weatherUIData.image
        self.maxTempLabel.text = weatherUIData.maxTemp
        self.minTempLabel.text = weatherUIData.minTemp
    }
    
    func inject(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}

