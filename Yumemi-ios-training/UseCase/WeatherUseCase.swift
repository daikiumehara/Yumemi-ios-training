//
//  WeatherUseCase.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

protocol WeatherUseCaseOutput: AnyObject {
    func changeWeather(weatherInfo: WeatherInfo)
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
        weatherRepository.syncFetchWeather(param: param) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherInfo):
                    self.output?.changeWeather(weatherInfo: weatherInfo)
                case .failure(let error):
                    self.output?.happenedError(error: error.text)
                }
            }
        }
    }
}
