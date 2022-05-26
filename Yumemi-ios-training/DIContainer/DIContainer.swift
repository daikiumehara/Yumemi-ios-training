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
        let useCase = self.makeWeatherUseCase(
            weatherRepository: self.makeWeatherRepository(weatherClient: WeatherClient())
        )
        let presenter = WeatherPresenter(view: view,
                                      weatherUseCase: useCase)
        useCase.output = presenter
        return presenter
    }
    
    //MARK: - UseCase
    static func makeWeatherUseCase(weatherRepository: WeatherRepositoryProtocol) -> WeatherUseCaseProtocol {
        return WeatherUseCase(weatherRepository: weatherRepository)
    }
    
    //MARK: - Repository
    static func makeWeatherRepository(weatherClient: WeatherClientProtocol) -> WeatherRepositoryProtocol {
        return WeatherRepository(weatherClient: weatherClient)
    }
}
