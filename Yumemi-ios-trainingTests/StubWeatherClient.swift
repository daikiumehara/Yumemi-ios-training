//
//  StubWeatherClient.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/07/04.
//

import Foundation
@testable import Yumemi_ios_training

class StubWeatherClient: WeatherClientProtocol {
    var dummyWeather: Weather!
    var dummyInfraWeatherInfo: InfraWeatherInfo!
    var dummyInfraAreaInfoList: [InfraAreaInfo]!
    
    func fetchWeather() throws -> Weather {
        dummyWeather
    }
    
    func fetchWeather(area: String) throws -> Weather {
        dummyWeather
    }
    
    func fetchWeather(jsonString: String) throws -> InfraWeatherInfo {
        dummyInfraWeatherInfo
    }
    
    func syncFetchWeather(_ jsonString: String) async throws -> InfraWeatherInfo {
        dummyInfraWeatherInfo
    }
    
    func syncFetchWeatherList(_ jsonString: String) async throws -> [InfraAreaInfo] {
        dummyInfraAreaInfoList
    }
}
