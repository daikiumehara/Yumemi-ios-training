//
//  WeatherUseCase.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherUseCaseOutput: AnyObject {
    func changeWeather(info: WeatherInfo)
    func happenedError(error: String)
}

protocol WeatherUseCaseProtocol: AnyObject {
    var output: WeatherUseCaseOutput? { get set }
    func fetchWeather()
}

final class WeatherUseCase: WeatherUseCaseProtocol {
    weak var output: WeatherUseCaseOutput?
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
    func fetchWeather() {
        let param = FetchParameter(area: "tokyo",
                                     date: Date())
        let result = self.weatherRepository.fetchWeather(param: param)
        switch result {
        case .success(let weather):
            self.output?.changeWeather(info: weather)
        case .failure(let error):
            self.output?.happenedError(error: error.text)
        }
    }
}
