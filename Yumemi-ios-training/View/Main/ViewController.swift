//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol MainViewProtocol: NSObjectProtocol {
    func changeWeatherImage(image: UIImage)
}

class ViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        
    }
}

extension ViewController: MainViewProtocol {
    func changeWeatherImage(image: UIImage) {
        self.weatherImageView.image = image
    }
}

