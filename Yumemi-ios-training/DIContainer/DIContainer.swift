//
//  DIContainer.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

struct DIContainer {
    //MARK: - Presenter
    static func getWeatherPresenter(view: WeatherViewProtocol) -> WeatherPresenterProtocol {
        let useCase = self.makeWeatherUseCase()
        let presenter = WeatherPresenter(view: view,
                                      weatherUseCase: useCase)
        useCase.output = presenter
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
