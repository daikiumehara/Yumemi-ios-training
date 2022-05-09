//
//  WeatherUseCase.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherUseCaseOutput: AnyObject {
    func changeWeather(weather: WeatherInfo)
    func happenedError(error: String)
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
        let params = SearchParameter(area: "tokyo",
                                     date: "2020-04-01T12:00:00+09:00")
        let result = self.weatherRepository.fetchWeather(params: params)
        switch result {
        case .success(let weather):
            self.output?.changeWeather(weather: weather)
        case .failure(let error):
            self.output?.happenedError(error: error.text)
        }
    }
}
