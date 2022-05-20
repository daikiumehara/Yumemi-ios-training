//
//  InfraWeatherInfo.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/09.
//

import Foundation

struct InfraWeatherInfo: Codable {
    let maxTemp: Int
    let minTemp: Int
    let date: Date
    let weather: Weather
}
