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
    func fetchWeather(area: String) -> Result<Weather, APIError>
}

final class WeatherRepository: WeatherRepositoryProtocol {
    func fetchWeather() -> Weather {
        return WeatherClient.fetchWeather()
    }
    
    func fetchWeather(area: String) -> Result<Weather, APIError> {
        do {
            let weather = try WeatherClient.fetchWeather(area: area)
            return .success(weather)
        } catch let error as YumemiWeatherError {
            switch error {
            case .invalidParameterError:
                return .failure(.invalidParameter)
            case .unknownError:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unexpected)
        }
    }
}
