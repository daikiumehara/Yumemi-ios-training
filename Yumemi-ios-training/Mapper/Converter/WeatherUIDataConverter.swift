//
//  WeatherDataConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct WeatherUIDataConverter {
    static func convert(weatherInfo: WeatherInfo) -> WeatherUIData {
        return WeatherUIData(image: WeatherImageConverter.convert(weather: weatherInfo.weather),
                           maxTemp: weatherInfo.maxTemp.description,
                           minTemp: weatherInfo.minTemp.description)
    }
}
