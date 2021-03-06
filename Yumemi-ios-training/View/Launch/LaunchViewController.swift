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
        weatherVC.presenter = DIContainer.getWeatherPresenter(view: weatherVC, weatherClient: WeatherClient())
        weatherVC.modalPresentationStyle = .fullScreen
        present(weatherVC, animated: true)
    }
    
}
