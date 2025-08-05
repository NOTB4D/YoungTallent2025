//
//  ContentType.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

public enum ContentType {
    case json
    case formUrlEncoded
    case multipartFormData(String)
    
    var rawValue: String {
        switch self {
        case .json:
            return "application/json"
        case .formUrlEncoded:
            return "application/x-www-form-urlencoded"
        case let .multipartFormData(boundary):
            return "multipart/form-data; boundary=\(boundary)"
        }
    }
}
