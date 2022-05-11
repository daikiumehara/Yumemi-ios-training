//
//  LaunchViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/11.
//

import UIKit

class LaunchViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        guard let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {
            print("VCが見つかりませんでした。")
            return
        }
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }
}
