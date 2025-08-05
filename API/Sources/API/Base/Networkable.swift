//
//  Networkable.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

public protocol Networkable {
    func request() async -> URLRequest
}


public extension Networkable {
    
    func fetch() async throws -> Data {
        do{
            let (data,response) = try await URLSession.shared.data(for: request())
            return data
        } catch{
            throw error
        }
    }
}
