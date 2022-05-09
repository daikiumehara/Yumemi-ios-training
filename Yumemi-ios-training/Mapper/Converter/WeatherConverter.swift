//
//  WeatherConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

struct WeatherConverter {
    static func convert(weather: Weather) -> WeatherImageData {
        switch weather {
        case.sunny:
            return WeatherImageData(image: #imageLiteral(resourceName: "sunny").withTintColor(.red))
        case .cloudy:
            return WeatherImageData(image: #imageLiteral(resourceName: "cloudy").withTintColor(.gray))
        case .rainy:
            return WeatherImageData(image: #imageLiteral(resourceName: "rainy").withTintColor(.blue))
        case .none:
            // 画像がないので一旦sunnyのgrayを返す
            return WeatherImageData(image: #imageLiteral(resourceName: "sunny").withTintColor(.gray))
        }
    }
}
