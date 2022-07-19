//
//  LaunchViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/11.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        let weatherVC = WeatherViewController.instantiate()
        if ProcessInfo.processInfo.arguments.contains("UITEST") {
            // UI Testの場合
            let presenter = MockWeatherPresenter(view: weatherVC)
            presenter.weatherInfo = WeatherInfo(maxTemp: 20, minTemp: 10, weather: .sunny)
            weatherVC.presenter = presenter
        } else {
            weatherVC.presenter = DIContainer.getWeatherPresenter(view: weatherVC, weatherClient: WeatherClient())
        }
        weatherVC.modalPresentationStyle = .fullScreen
        present(weatherVC, animated: true)
    }
    
}
