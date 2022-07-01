//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

final class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    
    private weak var alert: UIAlertController?
    private var area: String!
    private var weatherData: WeatherUIData!
    var repository: WeatherRepositoryProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification,
                                               object: nil,
                                               queue: .main) { [weak self] _ in
            self?.fetchWeather()
        }
        changeWeather(weatherUIData: weatherData)
    }
    
    deinit {
        print("ViewController deinit")
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        reloadButton.isEnabled = false
        fetchWeather()
    }
    
    private func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = ErrorAlertBuilder.build(message: message)
        self.alert = alert
        present(alert, animated: true)
    }
    
    private func fetchWeather() {
        indicator.startAnimating()
        closeErrorAlert()
        Task {
            let result = await self.repository.syncFetchWeather(param: FetchParameter(area: self.area,
                                                                                      date: Date()))
            self.indicator.stopAnimating()
            self.enableReloadButton()
            switch result {
            case .success(let weatherInfo):
                self.changeWeather(weatherUIData: WeatherUIData(weatherInfo: weatherInfo))
            case .failure(let error):
                self.showErrorAlert(message: error.text)
            }
        }
    }
    
    private func changeWeather(weatherUIData: WeatherUIData) {
        weatherData = weatherUIData
        weatherImageView.image = weatherUIData.image
        maxTempLabel.text = weatherUIData.maxTemp
        minTempLabel.text = weatherUIData.minTemp
    }
    
    private func closeErrorAlert() {
        alert?.dismiss(animated: true)
    }
    
    private func enableReloadButton() {
        reloadButton.isEnabled = true
    }
}

extension WeatherViewController {
    static func instantiate(areaData: AreaData) -> WeatherViewController {
        guard let initialVC = UIStoryboard(name: "Weather", bundle: nil).instantiateInitialViewController() as? WeatherViewController else {
            fatalError("VCが見つかりませんでした。")
        }
        initialVC.area = areaData.area
        initialVC.weatherData = areaData.weatherUIData
        return initialVC
    }
}
