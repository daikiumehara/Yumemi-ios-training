//
//  AreaConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/16.
//

import Foundation

struct AreaConverter {
    static private func convert(areaInfo: AreaInfo) -> AreaData {
        AreaData(weatherUIData: WeatherUIData(weatherInfo: areaInfo.weatherInfo),
                 area: areaInfo.area)
    }

    static func convert(areaInfoList: [AreaInfo]) -> [AreaData] {
        areaInfoList.map { convert(areaInfo: $0) }
    }
}
