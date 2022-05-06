//
//  WeatherClient.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation
import YumemiWeather

struct WeatherClient {
    static func fetchWeather() -> Weather {
        let weather = YumemiWeather.fetchWeather()
        return Weather.create(weather)
    }
    
    static func fetchWeather(at: String) throws -> Weather {
        let weather = try YumemiWeather.fetchWeather(at: at)
        return Weather(rawValue: weather)!
    }
}
