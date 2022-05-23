//
//  ErrorAlertGenerator.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import UIKit

struct ErrorAlertBuilder {
    static func build(message: String) -> UIAlertController {
        let action = UIAlertAction(title: "OK",
                                   style: .default)
        let alert = UIAlertController(title: "エラー",
                                       message: message,
                                       preferredStyle: .alert)
        alert.addAction(action)
        return alert
    }
}
