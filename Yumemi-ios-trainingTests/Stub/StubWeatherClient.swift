//
//  StubWeatherClient.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/26.
//

import Foundation
@testable import Yumemi_ios_training

final class StubWeatherClient: WeatherClientProtocol {
    var dummyWeather: Weather!
    var dummyInfraWeatherInfo: InfraWeatherInfo!
    
    func fetchWeather() -> Weather {
        dummyWeather
    }
    
    func fetchWeather(area: String) -> Weather {
        dummyWeather
    }
    
    func fetchWeather(jsonString: String) -> InfraWeatherInfo {
        dummyInfraWeatherInfo
    }
    
    func syncFetchWeather(_ jsonString: String) throws -> InfraWeatherInfo {
        Thread.sleep(forTimeInterval: 1.0)
        return dummyInfraWeatherInfo
    }
}
