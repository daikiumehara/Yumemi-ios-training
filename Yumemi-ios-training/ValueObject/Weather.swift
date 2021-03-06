//
//  Weather.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

enum Weather: String, Codable {
    case sunny
    case cloudy
    case rainy
    
    static func create(_ weatherString: String) throws -> Weather {
        guard let weather = Weather(rawValue: weatherString) else {
            throw APIError.missDecode
        }
        return weather
    }
}

