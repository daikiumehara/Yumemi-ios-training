//
//  WeatherRepository.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation
import YumemiWeather

protocol WeatherRepositoryProtocol: AnyObject {
    func fetchWeather() -> Weather
    func fetchWeather(at: String) -> Result<Weather, APIError>
}

final class WeatherRepository: WeatherRepositoryProtocol {
    func fetchWeather() -> Weather {
        return WeatherClient.fetchWeather()
    }
    
    func fetchWeather(at: String) -> Result<Weather, APIError> {
        do {
            let weather = try WeatherClient.fetchWeather(at: at)
            return .success(weather)
        } catch {
            guard let error = error as? YumemiWeatherError else {
                return .failure(.unexpected)
            }
            switch error {
            case .invalidParameterError:
                return .failure(.invalidParameter)
            case .unknownError:
                return .failure(.unknown)
            }
        }
    }
}
