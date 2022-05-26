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
        self.image = WeatherImageConverter.convert(weather: weatherInfo.weather)
        self.maxTemp = weatherInfo.maxTemp.description
        self.minTemp = weatherInfo.minTemp.description
    }
}
