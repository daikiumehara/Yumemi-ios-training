//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol WeatherViewProtocol: AnyObject {
    func dismiss()
    func startIndicator()
    func stopIndicator()
    func changeWeather(weatherUIData: WeatherUIData)
    func showErrorAlert(message: String)
    func closeErrorAlert()
    func enableReloadButton()
}

final class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    
    private weak var alert: UIAlertController?
    var presenter: WeatherPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification,
                                               object: nil,
                                               queue: .main) { [weak self] _ in
            self?.presenter.reloadAction()
        }
    }
    
    deinit {
        print("ViewController deinit")
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        reloadButton.isEnabled = false
        presenter.reloadAction()
    }
}

extension WeatherViewController {
    static func instantiate() -> WeatherViewController {
        guard let initialVC = UIStoryboard(name: "Weather", bundle: nil).instantiateInitialViewController() as? WeatherViewController else {
            fatalError("VCが見つかりませんでした。")
        }
        return initialVC
    }
}

/*
 MainViewProtocolがDelegateになっており、Presenterに処理の移譲をし、
 処理が完了するとPresenterからViewControllerに通知される
 */
extension WeatherViewController: WeatherViewProtocol {
    func startIndicator() {
        indicator.startAnimating()
    }
    
    func stopIndicator() {
        indicator.stopAnimating()
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
    
    func showErrorAlert(message: String) {
        let alert = ErrorAlertBuilder.build(message: message)
        self.alert = alert
        present(alert, animated: true)
    }
    
    func changeWeather(weatherUIData: WeatherUIData) {
        weatherImageView.image = weatherUIData.image
        maxTempLabel.text = weatherUIData.maxTemp
        minTempLabel.text = weatherUIData.minTemp
    }
    
    func closeErrorAlert() {
        alert?.dismiss(animated: true)
    }
    
    func enableReloadButton() {
        reloadButton.isEnabled = true
    }
}

