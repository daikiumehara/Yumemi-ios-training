//
//  LaunchViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/11.
//

import UIKit

class LaunchViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        let mainVC = ViewController.instantiate()
        mainVC.inject(presenter: DIContainer.default.getMainPresenter(view: mainVC))
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }
    
}
