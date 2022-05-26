
//
//  WeatherPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherPresenterProtocol: AnyObject {
    func reloadAction()
}

final class WeatherPresenter: WeatherPresenterProtocol {
    private weak var view: WeatherViewProtocol?
    private let weatherUseCase: WeatherUseCaseProtocol
    
    init(view: WeatherViewProtocol,
         weatherUseCase: WeatherUseCaseProtocol) {
        self.view = view
        self.weatherUseCase = weatherUseCase
    }
    
    func reloadAction() {
        self.view?.startIndicator()
        self.view?.closeErrorAlert()
        self.weatherUseCase.fetchWeather()
    }
}

/*
 WeatherUseCaseOutputがDelegateになっており、UseCaseに処理の委譲をし、
 処理が完了するとUseCaseからPresenterに通知される仕組みになっている
 */
extension WeatherPresenter: WeatherUseCaseOutput {
    func changeWeather(weatherInfo: WeatherInfo) {
        self.view?.stopIndicator()
        self.view?.changeWeather(weatherUIData: WeatherUIData(weatherInfo: weatherInfo))
    }
    
    func happenedError(error: String) {
        self.view?.stopIndicator()
        self.view?.showErrorAlert(message: error)
    }
}
