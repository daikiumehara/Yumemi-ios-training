//
//  WeatherConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

struct WeatherConverter {
    static func convert(weather: Weather) -> WeatherData {
        switch weather {
        case.sunny:
            return WeatherData(image: #imageLiteral(resourceName: "sunny"), color: .red)
        case .cloudy:
            return WeatherData(image: #imageLiteral(resourceName: "cloudy"), color: .gray)
        case .rainy:
            return WeatherData(image: #imageLiteral(resourceName: "rainy"), color: .blue)
        case .none:
            // 画像がないので一旦sunnyのgrayを返す
            return WeatherData(image: #imageLiteral(resourceName: "sunny"), color: .gray)
        }
    }
}
