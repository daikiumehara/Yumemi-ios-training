//
//  WeatherData.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

// Weather表示用のDataを保持する構造体
struct WeatherData {
    let image: UIImage
    let color: UIColor
    
    var preconfiguredImage: UIImage {
        return image.withTintColor(color)
    }
}
