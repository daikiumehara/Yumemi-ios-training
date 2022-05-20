//
//  WeatherImageConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

struct WeatherImageConverter {
    static func convert(weather: Weather) -> UIImage {
            switch weather {
            case.sunny:
                return #imageLiteral(resourceName: "sunny").withTintColor(.red)
            case .cloudy:
                return #imageLiteral(resourceName: "cloudy").withTintColor(.gray)
            case .rainy:
                return #imageLiteral(resourceName: "rainy").withTintColor(.blue)
            case .none:
                // 画像がないので一旦sunnyのgrayを返す
                return #imageLiteral(resourceName: "sunny").withTintColor(.gray)
            }
        }
}
