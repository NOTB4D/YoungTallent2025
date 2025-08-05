//
//  AppResponse.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

public struct AppResponse<T: Decodable>: Decodable {
    public var results: T?
}
