//
//  URL+Extension.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

public extension URL{
    init (forceString string: String) {
        guard let url = URL(string: string) else {
            fatalError("could not init URL from string: \(string)")
        }
        self = url
    }
    
    func adding(parameters: [String: String]) -> URL {
        guard parameters.count > 0 else {
            return self
        }
        var queryItems: [URLQueryItem] = []
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        return adding(quertItems: queryItems)
    }
    
    private func adding(quertItems: [URLQueryItem]) -> URL {
        guard var urlComponent = URLComponents(string: absoluteString) else {
            fatalError("Could not create URLCOMPONENTS using URL from string: \(absoluteString)")
        }
        urlComponent.queryItems = quertItems
        guard let url = urlComponent.url else {
            fatalError("Could not create URL from URLComponents")
        }
        
        return url
    }
}

