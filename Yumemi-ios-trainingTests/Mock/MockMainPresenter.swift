//
//  MockMainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/12.
//

import Foundation

class MockMainPresneter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    
    func closeAction() {}
    func reloadAction() {}
}

extension MockMainPresneter: WeatherUseCaseOutput {
    func changeWeather(weather: WeatherInfo) {
        view?.changeWeather(data: WeatherConverter.convert(data: weather))
    }
    
    func happenedError(error: String) {
        view?.showErrorAlert(message: error)
    }
}
