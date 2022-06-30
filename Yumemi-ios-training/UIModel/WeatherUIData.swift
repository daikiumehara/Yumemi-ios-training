//
//  WeatherData.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import UIKit

struct WeatherUIData {
    let image: UIImage
    let maxTemp: String
    let minTemp: String
    
    init(weatherInfo: WeatherInfo) {
        image = WeatherImageConverter.convert(weather: weatherInfo.weather)
        maxTemp = weatherInfo.maxTemp.description
        minTemp = weatherInfo.minTemp.description
    }
}
