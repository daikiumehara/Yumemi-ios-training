//
//  LaunchViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/11.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
<<<<<<< HEAD
        let weatherVC = WeatherViewController.instantiate()
        weatherVC.presenter = DIContainer.default.getMainPresenter(view: weatherVC)
        weatherVC.modalPresentationStyle = .fullScreen
        self.present(weatherVC, animated: true)
=======
        let mainVC = ViewController.instantiate()
        mainVC.inject(presenter: DIContainer.getMainPresenter(view: mainVC))
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
    }
    
}
