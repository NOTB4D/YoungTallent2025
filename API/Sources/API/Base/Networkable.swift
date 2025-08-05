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
    
    func fetch<T: Decodable>() async throws -> T {
        let request = await request()
        do{
            let  (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            switch httpResponse.statusCode {
            case 401:
                // Handle refresh token
                throw URLError(.badServerResponse)
            case 200..<300:
                
                printResponse(request: request, data: data)
                if T.self is Data.Type {
                    return data as! T
                }
                if T.self is EmptyCodable.Type {
                    return EmptyCodable() as! T
                }
                
                let response = try decoder.decode(AppResponse<T>.self, from: data)
                
                if let result = response.results {
                    return result
                } else {
                    throw NSError(domain: "", code: -3, userInfo: [:])
                }
            default:
                throw URLError(.badServerResponse)
            }
            
        } catch{
            printErrorLog(request: request, error: error)
            throw error
        }
    }
}
