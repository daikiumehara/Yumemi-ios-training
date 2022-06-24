//
//  AreaInfoConverter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/16.
//
import Foundation

struct AreaInfoConverter {
    static func convert(infraAreaInfo: InfraAreaInfo) -> AreaInfo {
        AreaInfo(weatherInfo: WeatherInfoConverter.convert(infraWeatherInfo: infraAreaInfo.weatherInfo),
                 area: infraAreaInfo.area)
    }

    static func convert(infraAreaInfoList: [InfraAreaInfo]) -> [AreaInfo] {
        infraAreaInfoList.map { convert(infraAreaInfo: $0) }
    }
}
