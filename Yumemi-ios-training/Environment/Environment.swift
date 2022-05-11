//
//  Environment.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

struct Environment {
    //MARK: - Presenter
    static func makeMainPresenter(view: MainViewProtocol) -> MainPresenterProtocol {
        let useCase = self.makeWeatherUseCase()
        let presenter = MainPresenter(view: view,
                                      weatherUseCase: useCase)
        return presenter
    }
    
    //MARK: - UseCase
    private static func makeWeatherUseCase() -> WeatherUseCaseProtocol {
        return WeatherUseCase(weatherRepository: self.makeWeatherRepository())
    }
    
    //MARK: - Repository
    private static func makeWeatherRepository() -> WeatherRepositoryProtocol {
        return WeatherRepository()
    }
}
