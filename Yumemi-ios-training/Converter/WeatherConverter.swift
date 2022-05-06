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
            return WeatherData(image: UIImage(named: "sunny")!, color: .red)
        case .cloudy:
            return WeatherData(image: UIImage(named: "cloudy")!, color: .gray)
        case .rainy:
            return WeatherData(image: UIImage(named: "rainy")!, color: .blue)
        }
    }
}
