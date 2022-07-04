//
//  WeatherTableCell.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/16.
//

import UIKit

final class WeatherTableCell: UITableViewCell {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!

    static var className: String {
        String(describing: self)
    }

    func configure(data: AreaData) {
        weatherImageView.image = data.weatherUIData.image
        areaNameLabel.text = data.area
        maxTempLabel.text = data.weatherUIData.maxTemp
        minTempLabel.text = data.weatherUIData.minTemp
    }
}
