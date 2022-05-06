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
    func setOutput(_ output: WeatherUseCaseOutput)
    func fetchWeather() -> Weather
}

class WeatherUseCase: WeatherUseCaseProtocol {
    private weak var output: WeatherUseCaseOutput?
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
    func setOutput(_ output: WeatherUseCaseOutput) {
        self.output = output
    }
    
    func fetchWeather() -> Weather {
        self.weatherRepository.fetchWeather()
    }
}
