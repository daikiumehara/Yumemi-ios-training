//
//  MainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func onTapResetButton()
    func onTapReloadButton()
}

final class MainPresenter: MainPresenterProtocol {
    private weak var view: MainViewProtocol?
    private let weatherUseCase: WeatherUseCaseProtocol
    
    init(view: MainViewProtocol,
         weatherUseCase: WeatherUseCaseProtocol) {
        self.view = view
        self.weatherUseCase = weatherUseCase
    }
    
    func onTapResetButton() {
    }
    
    func onTapReloadButton() {
        self.weatherUseCase.fetchWeather()
    }
}

extension MainPresenter: WeatherUseCaseOutput {
    func changeWeather(weather: Weather) {
        self.view?.changeWeather(data: WeatherConverter.convert(weather: weather))
    }
    
    func happenedError(error: String) {
        self.view?.showErrorAlert(message: error)
    }
}
