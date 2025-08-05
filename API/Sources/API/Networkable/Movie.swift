//
//  Movie.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

extension API {
    public enum Movie: Networkable {
        case getMovie
        case getMoviewById(Int)
        
        public func request() async -> URLRequest {
            switch self {
            case .getMovie:
                return await getRequest(
                    url: API.getAPIURL("top_rated"),
                    queryItems: ["api_key" : "a9682a1bcb1c6843474a121144fd9071"]
                )
            case let .getMoviewById(request):
                return await getRequest(
                    url: API.getAPIURL("top_rated"),
                    queryItems: ["api_key" : "a9682a1bcb1c6843474a121144fd9071"]
                )
            }
            
        }
    }
}

