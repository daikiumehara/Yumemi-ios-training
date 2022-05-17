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
    func fetchWeather(params: SearchParameter) -> Result<WeatherInfo, APIError>
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
    
    func fetchWeather(params: SearchParameter) -> Result<WeatherInfo, APIError> {
        guard let params = try? JSONEncoder().encode(params),
              let jsonString = String(data: params, encoding: .utf8) else {
            return .failure(.missEncode)
        }
        do {
            guard let data = try WeatherClient.fetchWeather(jsonString: jsonString).data(using: .utf8) else {
                return .failure(.failedGetData)
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let info = try decoder.decode(InfraWeatherInfo.self,
                                                    from: data)
                return .success(WeatherInfoConverter.convert(data: info))
            } catch {
                return .failure(.missDecode)
            }
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
