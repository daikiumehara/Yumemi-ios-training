//
//  MockMainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/12.
//

import Foundation

<<<<<<< HEAD
class MockMainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var data: WeatherInfo!
    
    func closeAction() {}
    
    func reloadAction() {
        self.changeWeather(weather: self.data)
    }
}

extension MockMainPresenter: WeatherUseCaseOutput {
=======
class MockMainPresneter: MainPresenterProtocol {
    func onTapCloseButton() {}
    
    weak var view: MainViewProtocol?
    
    func onTapReloadButton() {}
    func didBecomeActice() {}
}

extension MockMainPresneter: WeatherUseCaseOutput {
>>>>>>> 35d22b0 (MockのPresenterを作成しました)
    func changeWeather(weather: WeatherInfo) {
        view?.changeWeather(data: WeatherConverter.convert(data: weather))
    }
    
<<<<<<< HEAD
    func happenedError(error: String) {
=======
    func happendError(error: String) {
>>>>>>> 35d22b0 (MockのPresenterを作成しました)
        view?.showErrorAlert(message: error)
    }
}
