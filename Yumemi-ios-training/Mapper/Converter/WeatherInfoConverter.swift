//
//  WeatherInfoConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct WeatherInfoConverter {
    static func convert(info: InfraWeatherInfo) -> WeatherInfo {
        return WeatherInfo(maxTemp: info.maxTemp,
                           minTemp: info.minTemp,
                           weather: info.weather)
    }
}
