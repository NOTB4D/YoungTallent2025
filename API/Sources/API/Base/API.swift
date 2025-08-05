//
//  API.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

public enum API {
    static func getAPIURL(_ trail: String) -> URL {
        guard let baseURL = Bundle.main.infoForKey("BACKEND_URL") else {
            fatalError("Backend Url Okunamadı")
        }
        
        guard let url = URL(string: "\(baseURL)/\(trail)") else {
            fatalError("Url Oluşturulamadı")
        }
        return url
    }
}
