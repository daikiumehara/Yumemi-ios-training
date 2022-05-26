//
//  DIContainer.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

struct DIContainer {
    static let `default` = DIContainer(weatherClient: WeatherClient())
    private let weatherClient: WeatherClientProtocol
    
    init(weatherClient: WeatherClientProtocol) {
        self.weatherClient = weatherClient
    }
    
    //MARK: - Presenter
    func getMainPresenter(view: MainViewProtocol) -> MainPresenterProtocol {
        let useCase = self.makeWeatherUseCase()
        let presenter = MainPresenter(view: view,
                                      weatherUseCase: useCase)
        useCase.output = presenter
        return presenter
    }
    
    //MARK: - UseCase
    private func makeWeatherUseCase() -> WeatherUseCaseProtocol {
        return WeatherUseCase(weatherRepository: self.makeWeatherRepository())
    }
    
    //MARK: - Repository
    private func makeWeatherRepository() -> WeatherRepositoryProtocol {
        return WeatherRepository(weatherClient: self.weatherClient)
    }
}
