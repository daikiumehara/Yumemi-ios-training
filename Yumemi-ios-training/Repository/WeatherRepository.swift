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
    func fetchWeather(jsonString: String) -> Result<WeatherInfo, APIError>
}

final class WeatherRepository: WeatherRepositoryProtocol {
    func fetchWeather() -> Weather {
        return WeatherClient.fetchWeather()
    }
    
    func fetchWeather(area: String) -> Result<Weather, APIError> {
        do {
            let weather = try WeatherClient.fetchWeather(area: area)
            return .success(weather)
        } catch {
            let error = self.convertError(error: error)
            return .failure(error)
        }
    }
    
    func fetchWeather(jsonString: String) -> Result<WeatherInfo, APIError> {
        do {
            guard let data = try WeatherClient.fetctWeather(jsonString: jsonString)
                .data(using: .utf8) else {
                return .failure(.failedGetData)
            }
            
            do {
                let info = try JSONDecoder().decode(InfraWeatherInfo.self, from: data)
                return .success(WeatherInfoConverter.convert(data: info))
            } catch {
                return .failure(.missDecode)
            }
            
        } catch {
            let error = self.convertError(error: error)
            return .failure(error)
        }
    }
    
    private func convertError(error: Error) -> APIError {
        guard let error = error as? YumemiWeatherError else {
            return .unexpected
        }
        switch error {
        case .invalidParameterError: return .invalidParameter
        case .unknownError: return .unknown
        }
    }
}
