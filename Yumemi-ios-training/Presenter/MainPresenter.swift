
//
//  MainPresenter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
<<<<<<< HEAD
    func closeAction()
    func reloadAction()
}

final class MainPresenter: MainPresenterProtocol {
=======
    func onTapCloseButton()
    func onTapReloadButton()
    func didBecomeActice()
}

class MainPresenter: MainPresenterProtocol {
>>>>>>> 35d22b0 (MockのPresenterを作成しました)
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
        self.weatherUseCase.fetchWeather()
    }
    
    func didBecomeActice() {
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
