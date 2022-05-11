//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func dismiss()
    func changeWeather(weatherData: WeatherUIData)
    func showErrorAlert(message: String)
}

final class ViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    private var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = DIContainer.getMainPresenter(view: self)
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        self.presenter?.onTapResetButton()
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        self.presenter?.onTapReloadButton()
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
    
    func changeWeather(weatherData: WeatherUIData) {
        self.weatherImageView.image = weatherData.image
        self.maxTempLabel.text = weatherData.maxTemp
        self.minTempLabel.text = weatherData.minTemp
    }
}

