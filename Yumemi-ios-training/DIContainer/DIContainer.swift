//
//  DIContainer.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

struct DIContainer {
    //MARK: - Repository
    static func makeWeatherRepository() -> WeatherRepositoryProtocol {
        WeatherRepository(weatherClient: WeatherClient())
    }
}
