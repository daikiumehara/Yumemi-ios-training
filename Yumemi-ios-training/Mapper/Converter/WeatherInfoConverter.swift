//
//  WeatherInfoConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct WeatherInfoConverter {
    static func convert(infraWeatherInfo: InfraWeatherInfo) -> WeatherInfo {
        WeatherInfo(maxTemp: infraWeatherInfo.maxTemp,
                    minTemp: infraWeatherInfo.minTemp,
                    weather: infraWeatherInfo.weather)
    }
}
