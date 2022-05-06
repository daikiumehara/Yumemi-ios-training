//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func changeWeather(data: WeatherData)
}

final class ViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    
    private var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = Environment.makeMainPresenter(view: self)
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        
    }
    
    @IBAction func onTapReloadButton(_ sender: Any) {
        self.presenter?.onTapReloadButton()
    }
}

extension ViewController: MainViewProtocol {
    func changeWeather(data: WeatherData) {
        let image = data.image.withTintColor(data.color)
        self.weatherImageView.image = image
    }
}

