//
//  DIContainer.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

struct DIContainer {
    //MARK: - Presenter
    static func getWeatherPresenter(view: WeatherViewProtocol, weatherClient: WeatherClientProtocol) -> WeatherPresenterProtocol {
        let useCase = self.makeWeatherUseCase(
            weatherRepository: self.makeWeatherRepository(weatherClient: weatherClient)
        )
        let presenter = WeatherPresenter(view: view,
                                      weatherUseCase: useCase)
        useCase.output = presenter
        return presenter
    }
    
    //MARK: - UseCase
    private static func makeWeatherUseCase(weatherRepository: WeatherRepositoryProtocol) -> WeatherUseCaseProtocol {
        WeatherUseCase(weatherRepository: weatherRepository)
    }
    
    //MARK: - Repository
    private static func makeWeatherRepository(weatherClient: WeatherClientProtocol) -> WeatherRepositoryProtocol {
        WeatherRepository(weatherClient: weatherClient)
    }
}
