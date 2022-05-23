//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func inject(presenter: MainPresenterProtocol)
    func dismiss()
    func startIndicator()
    func stopIndicator()
    func changeWeather(weatherUIData: WeatherUIData)
    func showErrorAlert(message: String)
    func closeErrorAlert()
}

final class ViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    private var presenter: MainPresenterProtocol?
    private weak var alert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification,
                                               object: nil,
                                               queue: .main) { [weak self] _ in
            self?.presenter?.reloadAction()
        }
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
    func startIndicator() {
        self.indicator.startAnimating()
    }
    
    func stopIndicator() {
        self.indicator.stopAnimating()
    }
    
    func dismiss() {
        self.dismiss(animated: true)
    }
    
    func showErrorAlert(message: String) {
        let alert = ErrorAlertBuilder.build(message: message)
        self.alert = alert
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
    
    func closeErrorAlert() {
        self.alert?.dismiss(animated: true)
    }
}

