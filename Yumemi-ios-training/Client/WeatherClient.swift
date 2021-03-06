//
//  WeatherClient.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation
import YumemiWeather

protocol WeatherClientProtocol: AnyObject {
    func fetchWeather() throws -> Weather
    func fetchWeather(area: String) throws -> Weather
    func fetchWeather(jsonString: String) throws -> InfraWeatherInfo
    func syncFetchWeather(_ jsonString: String) async throws -> InfraWeatherInfo
}

final class WeatherClient: WeatherClientProtocol {
    func fetchWeather() throws -> Weather {
        let weather = YumemiWeather.fetchWeather()
        return try Weather.create(weather)
    }
    
    func fetchWeather(area: String) throws -> Weather {
        let weather = try YumemiWeather.fetchWeather(at: area)
        return try Weather.create(weather)
    }
    
    func fetchWeather(jsonString: String) throws -> InfraWeatherInfo {
        let jsonString = try YumemiWeather.fetchWeather(jsonString)
        guard let data = jsonString.data(using: .utf8) else {
            throw APIError.failedGetData
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        guard let infraWeatherInfo = try? decoder.decode(InfraWeatherInfo.self,
                                                         from: data) else {
            throw APIError.missDecode
        }
        return infraWeatherInfo
    }
    
    func syncFetchWeather(_ jsonString: String) async throws -> InfraWeatherInfo {
        let jsonString = try YumemiWeather.syncFetchWeather(jsonString)
        guard let data = jsonString.data(using: .utf8) else {
            throw APIError.failedGetData
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        guard let infraWeatherInfo = try? decoder.decode(InfraWeatherInfo.self,
                                                         from: data) else {
            throw APIError.missDecode
        }
        return infraWeatherInfo
    }
}
