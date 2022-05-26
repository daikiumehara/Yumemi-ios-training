//
//  MockWeatherClient.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/26.
//

import Foundation
@testable import Yumemi_ios_training

final class StubWeatherClient: WeatherClientProtocol {
    var mockWeather: Weather!
    var mockInfraWeatherInfo: InfraWeatherInfo!
    
    func fetchWeather() -> Weather {
        self.mockWeather
    }
    
    func fetchWeather(area: String) throws -> Weather {
        self.mockWeather
    }
    
    func fetchWeather(jsonString: String) throws -> InfraWeatherInfo {
        self.mockInfraWeatherInfo
    }
    
    func syncFetchWeather(_ jsonString: String) throws -> InfraWeatherInfo {
        Thread.sleep(forTimeInterval: 1.0)
        return self.mockInfraWeatherInfo
    }
}
