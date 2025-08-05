//
//  GetMovieREsponse.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

// MARK: - Result
public struct MovieResponse: Decodable {
    public let title: String?


    public init( title: String?) {
        self.title = title
    }
}
