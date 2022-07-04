//
//  EmptyDataTableCell.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/06/06.
//

import UIKit

final class EmptyDataTableCell: UITableViewCell {
    @IBOutlet weak var sunnyImageView: UIImageView!
    @IBOutlet weak var cloudyImageView: UIImageView!
    @IBOutlet weak var rainyImageView: UIImageView!

    static var className: String {
        String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        sunnyImageView.image = #imageLiteral(resourceName: "sunny").withTintColor(.gray)
        cloudyImageView.image = #imageLiteral(resourceName: "cloudy").withTintColor(.gray)
        rainyImageView.image = #imageLiteral(resourceName: "rainy").withTintColor(.gray)
    }
}
