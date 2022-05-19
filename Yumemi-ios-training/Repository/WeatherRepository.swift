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
            let weather = try WeatherClient.fetchWeather(jsonString: jsonString)
            guard let data = weather.data(using: .utf8) else {
                return .failure(.failedGetData)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601
            guard let info = try? decoder.decode(InfraWeatherInfo.self,
                                             from: data) else {
                return .failure(.missDecode)
            }
            return .success(WeatherInfoConverter.convert(infraWeatherInfo: info))
        } catch {
            let apiError = self.convertError(error: error)
            return .failure(apiError)
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
