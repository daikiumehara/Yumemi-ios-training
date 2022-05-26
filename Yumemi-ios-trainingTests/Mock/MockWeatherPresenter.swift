//
//  MockMainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/12.
//

import Foundation
@testable import Yumemi_ios_training

final class MockWeatherPresenter: WeatherPresenterProtocol {
    weak var view: WeatherViewProtocol?
    private var weatherUseCase: WeatherUseCaseProtocol
    
    init(view: WeatherViewProtocol,
         weatherUseCase: WeatherUseCaseProtocol) {
        self.view = view
        self.weatherUseCase = weatherUseCase
    }
    
    
    var data: WeatherInfo!
    
    func closeAction() {}
    
    func reloadAction() {
        self.changeWeather(weatherInfo: self.data)
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
