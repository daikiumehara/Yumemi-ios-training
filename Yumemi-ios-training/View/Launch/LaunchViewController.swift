//
//  LaunchViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/11.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        let listVC = WeatherListViewController.instantiate()
        listVC.modalPresentationStyle = .fullScreen
        listVC.repository = DIContainer.makeWeatherRepository()
        let navigationVC = UINavigationController(rootViewController: listVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
    
}
