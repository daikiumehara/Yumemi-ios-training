//
//  WeatherInfoConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct WeatherInfoConverter {
    static func convert(data: InfraWeatherInfo) -> WeatherInfo {
        return WeatherInfo(maxTemp: data.maxTemp,
                           minTemp: data.minTemp,
                           weather: Weather(rawValue: data.weather)!)
    }
}
