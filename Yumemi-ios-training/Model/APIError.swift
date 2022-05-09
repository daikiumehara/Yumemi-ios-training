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
    case missDecode
    case failedGetData
    
    var text: String {
        switch self {
        case .unknown: return "不明なエラーが発生しました"
        case .invalidParameter: return "無効なパラメータが渡されました"
        case .unexpected: return "予想外のエラーが発生しました"
        case .missDecode: return "デコードに失敗しました"
        case .failedGetData: return "データの取得に失敗しました"
        }
    }
}
