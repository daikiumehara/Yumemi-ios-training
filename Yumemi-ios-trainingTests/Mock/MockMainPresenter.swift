//
//  MockMainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/12.
//

import Foundation

class MockMainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var data: WeatherInfo!
    
    func closeAction() {}
    
    func reloadAction() {
        self.changeWeather(weatherInfo: self.data)
    }
}

extension MockMainPresenter: WeatherUseCaseOutput {
    func changeWeather(weatherInfo: WeatherInfo) {
        view?.changeWeather(weatherUIData: WeatherUIDataConverter.convert(weatherInfo: weatherInfo))
    }
    
    func happenedError(error: String) {
        view?.showErrorAlert(message: error)
    }
}
