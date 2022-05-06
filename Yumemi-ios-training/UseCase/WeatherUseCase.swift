//
//  WeatherUseCase.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherUseCaseOutput: NSObjectProtocol {
    
}

protocol WeatherUseCaseProtocol {
    func fetchWeather() -> Weather
}

class WeatherUseCase: WeatherUseCaseProtocol {
    private weak var output: WeatherUseCaseOutput?
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(output: WeatherUseCaseOutput,
        weatherRepository: WeatherRepositoryProtocol) {
        self.output = output
        self.weatherRepository = weatherRepository
    }
    
    func fetchWeather() -> Weather {
        self.weatherRepository.fetchWeather()
    }
}
