//
//  InfraAreaInfo.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/06/24.
//

import Foundation

struct InfraAreaInfo: Decodable {
    let area: String
    let weatherInfo: InfraWeatherInfo

    private enum CodingKeys: String, CodingKey {
        case area
        case weatherInfo = "info"
    }
}
