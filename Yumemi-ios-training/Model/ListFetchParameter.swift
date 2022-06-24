//
//  ListSearchParameter.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/16.
//

import Foundation

struct ListFetchParameter: Encodable {
    let areas: [String]
    let date: Date
}
