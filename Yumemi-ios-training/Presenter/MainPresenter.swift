
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
        self.view?.startIndicator()
<<<<<<< HEAD
        self.weatherUseCase.fetchWeather()
    }
    
    func didBecomeActice() {
=======
>>>>>>> bf96fc0 (Syncメソッドを用いてデータを取得するように変更しました。)
        self.weatherUseCase.fetchWeather()
    }
}

extension MainPresenter: WeatherUseCaseOutput {
    func changeWeather(weather: WeatherInfo) {
        self.view?.stopIndicator()
        self.view?.changeWeather(data: WeatherConverter.convert(data: weather))
    }
    
    func happenedError(error: String) {
        self.view?.stopIndicator()
        self.view?.showErrorAlert(message: error)
    }
}
