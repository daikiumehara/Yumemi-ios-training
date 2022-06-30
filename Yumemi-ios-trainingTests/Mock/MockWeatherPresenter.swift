//
//  MockMainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/12.
//

import Foundation
@testable import Yumemi_ios_training
import XCTest

final class MockWeatherPresenter: WeatherPresenterProtocol {
    weak var view: WeatherViewProtocol?
    var weatherInfo: WeatherInfo!
    
    init(view: WeatherViewProtocol) {
        self.view = view
    }
    
    func closeAction() {}
    
    func reloadAction() {
        changeWeather(weatherInfo: weatherInfo)
    }
}

extension MockWeatherPresenter: WeatherUseCaseOutput {
    func changeWeather(weatherInfo: WeatherInfo) {
        view?.changeWeather(weatherUIData: WeatherUIData(weatherInfo: weatherInfo))
    }
    
    func happenedError(error: String) {
        view?.showErrorAlert(message: error)
    }
}
