//
//  MockWeatherClient.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/26.
//

import Foundation
@testable import Yumemi_ios_training

final class MockWeatherClient: WeatherClientProtocol {
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
}
