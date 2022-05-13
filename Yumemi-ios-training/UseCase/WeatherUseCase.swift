//
//  WeatherUseCase.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherUseCaseProtocol {
    func fetchWeather() -> Weather
}

final class WeatherUseCase: WeatherUseCaseProtocol {
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
    func fetchWeather() -> Weather {
        self.weatherRepository.fetchWeather()
    }
}
