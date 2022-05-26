//
//  APIError.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

enum APIError: Error {
    case unexpected
    case invalidParameter
    case unknown
    case missEncode
    case missDecode
    case failedGetData
    
    var text: String {
        switch self {
        case .unexpected: return "予想外のエラーが発生しました"
        case .invalidParameter: return "無効なパラメータが渡されました"
        case .unknown: return "不明なエラーが発生しました"
        case .missEncode: return "エンコードに失敗しました"
        case .missDecode: return "デコードに失敗しました"
        case .failedGetData: return "値の取得に失敗しました"
        }
    }
}
