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
    private var weatherUseCase: WeatherUseCaseProtocol
    var exp: XCTestExpectation!
    
    init(view: WeatherViewProtocol,
         weatherUseCase: WeatherUseCaseProtocol) {
        self.view = view
        self.weatherUseCase = weatherUseCase
    }
    
    func closeAction() {}
    
    func reloadAction() {
        self.weatherUseCase.fetchWeather()
    }
}

extension MockWeatherPresenter: WeatherUseCaseOutput {
    func changeWeather(weatherInfo: WeatherInfo) {
        view?.changeWeather(weatherUIData: WeatherUIData(weatherInfo: weatherInfo))
        exp.fulfill()
    }
    
    func happenedError(error: String) {
        view?.showErrorAlert(message: error)
    }
}
