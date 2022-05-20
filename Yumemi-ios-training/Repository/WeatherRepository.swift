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
    func fetchWeather(param: FetchParameter) -> Result<WeatherInfo, APIError>
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
            let apiError = self.convertError(error: error)
            return .failure(apiError)
        }
    }
    
    func fetchWeather(param: FetchParameter) -> Result<WeatherInfo, APIError> {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        guard let param = try? encoder.encode(param),
              let jsonString = String(data: param, encoding: .utf8) else {
            return .failure(.missEncode)
        }
        do {
            let infraWeatherInfo = try WeatherClient.fetchWeather(jsonString: jsonString)
            return .success(WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo))
        } catch {
            let apiError = self.convertError(error: error)
            return .failure(apiError)
        }
    }
    
    private func convertError(error: Error) -> APIError {
        if let yumemiWeatherError = error as? YumemiWeatherError {
            switch yumemiWeatherError {
            case .invalidParameterError: return .invalidParameter
            case .unknownError: return .unknown
            }
        }
        if let apiError = error as? APIError {
            return apiError
        }
        return .unexpected
    }
}
