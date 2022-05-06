//
//  YumemiWeatherError.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

enum YumemiWeatherError: String, Error, Codable {
    case invalidParameterError
    case unknownError
}