//
//  WeatherConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct WeatherConverter {
    static func convert(data: WeatherInfo) -> WeatherData {
        return WeatherData(imageData: WeatherImageConverter.convert(weather: data.weather),
                           maxTemp: data.maxTemp.description,
                           minTemp: data.minTemp.description)
    }
}
