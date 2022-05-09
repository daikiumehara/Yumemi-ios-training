//
//  WeatherInfo.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct InfraWeatherInfo: Codable {
    let maxTemp: Int
    let minTemp: Int
    let date: String
    let weather: String
    
    private enum CodingKeys: String, CodingKey {
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case date
        case weather
    }
}
