
//
//  MainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func closeAction()
    func reloadAction()
}

final class MainPresenter: MainPresenterProtocol {
    private weak var view: MainViewProtocol?
    private let weatherUseCase: WeatherUseCaseProtocol
    
    init(view: MainViewProtocol,
         weatherUseCase: WeatherUseCaseProtocol) {
        self.view = view
        self.weatherUseCase = weatherUseCase
    }
    
    func closeAction() {
        self.view?.dismiss()
    }
    
    func reloadAction() {
        self.view?.closeErrorAlert()
        self.weatherUseCase.fetchWeather()
    }
}

extension MainPresenter: WeatherUseCaseOutput {
    func changeWeather(weatherInfo: WeatherInfo) {
        self.view?.changeWeather(weatherUIData: WeatherUIData(weatherInfo: weatherInfo))
    }
    
    func happenedError(error: String) {
        self.view?.showErrorAlert(message: error)
    }
}
