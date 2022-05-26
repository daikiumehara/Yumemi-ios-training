//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol WeatherViewProtocol: AnyObject {
    func dismiss()
    func changeWeather(weatherUIData: WeatherUIData)
    func showErrorAlert(message: String)
}

final class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var presenter: WeatherPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        self.presenter!.closeAction()
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        self.presenter!.reloadAction()
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

extension WeatherViewController: WeatherViewProtocol {
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
}

