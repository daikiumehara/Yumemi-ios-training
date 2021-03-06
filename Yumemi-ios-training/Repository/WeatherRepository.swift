//
//  WeatherRepository.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation
import YumemiWeather

protocol WeatherRepositoryProtocol: AnyObject {
    func fetchWeather() -> Result<Weather, APIError>
    func fetchWeather(area: String) -> Result<Weather, APIError>
    func fetchWeather(param: FetchParameter) -> Result<WeatherInfo, APIError>
    func syncFetchWeather(param: FetchParameter) async -> Result<WeatherInfo, APIError>
}

final class WeatherRepository: WeatherRepositoryProtocol {
    private let weatherClient: WeatherClientProtocol
    
    init(weatherClient: WeatherClientProtocol) {
        self.weatherClient = weatherClient
    }
    
    func fetchWeather() -> Result<Weather, APIError> {
        do {
            let weather = try weatherClient.fetchWeather()
            return .success(weather)
        } catch {
            let apiError = convertError(error: error)
            return .failure(apiError)
        }
    }
    
    func fetchWeather(area: String) -> Result<Weather, APIError> {
        do {
            let weather = try weatherClient.fetchWeather(area: area)
            return .success(weather)
        } catch {
            let apiError = convertError(error: error)
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
            let infraWeatherInfo = try weatherClient.fetchWeather(jsonString: jsonString)
            return .success(WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo))
        } catch {
            let apiError = convertError(error: error)
            return .failure(apiError)
        }
    }
    
    func syncFetchWeather(param: FetchParameter) async -> Result<WeatherInfo, APIError> {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        guard let param = try? encoder.encode(param),
              let jsonString = String(data: param, encoding: .utf8) else {
            return .failure(.missEncode)
        }
        do {
            let infraWeatherInfo = try await weatherClient.syncFetchWeather(jsonString)
            return .success(WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo))
        } catch {
            let apiError = convertError(error: error)
            return .failure(apiError)
        }
    }
    
    private func convertError(error: Error) -> APIError {
        switch error {
        case let error as YumemiWeatherError:
            return convertYumemiWeatherError(yumemiWeatherError: error)
        case let error as APIError:
            return error
        default:
            return .unexpected
        }
    }
    
    private func convertYumemiWeatherError(yumemiWeatherError: YumemiWeatherError) -> APIError {
        switch yumemiWeatherError {
        case .invalidParameterError: return .invalidParameter
        case .unknownError: return .unknown
        }
    }
}
