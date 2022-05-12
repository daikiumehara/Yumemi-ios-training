//
//  WeatherUseCase.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherUseCaseOutput: AnyObject {
    func changeWeather(weather: Weather)
    func happendError(error: String)
}

protocol WeatherUseCaseProtocol {
    func setOutput(_ output: WeatherUseCaseOutput)
    func fetchWeather()
}

final class WeatherUseCase: WeatherUseCaseProtocol {
    private weak var output: WeatherUseCaseOutput?
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
    func setOutput(_ output: WeatherUseCaseOutput) {
        self.output = output
    }
    
    func fetchWeather() {
        let result = self.weatherRepository.fetchWeather(at: "tokyo")
        switch result {
        case .success(let weather):
            self.output?.changeWeather(weather: weather)
        case .failure(let error):
            self.output?.happendError(error: error.text)
        }
    }
}
