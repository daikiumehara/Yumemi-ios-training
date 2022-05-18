//
//  WeatherDataConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct WeatherDataConverter {
    static func convert(info: WeatherInfo) -> WeatherData {
        return WeatherData(image: WeatherImageConverter.convert(weather: info.weather),
                           maxTemp: info.maxTemp.description,
                           minTemp: info.minTemp.description)
    }
}
