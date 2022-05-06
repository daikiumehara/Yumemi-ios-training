//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func changeWeather(data: WeatherData)
    func showErrorAlert(message: String)
}

final class ViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    
    private var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = DIContainer.getMainPresenter(view: self)
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        self.presenter?.onTapReloadButton()
    }
}

extension ViewController: MainViewProtocol {
    func showErrorAlert() {
        
    }
    
    func changeWeather(data: WeatherData) {
        self.weatherImageView.image = data.image
    }
}

