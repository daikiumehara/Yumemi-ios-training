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
        weatherVC.presenter = DIContainer.getWeatherPresenter(view: weatherVC)
        weatherVC.modalPresentationStyle = .fullScreen
        self.present(weatherVC, animated: true)
    }

}
