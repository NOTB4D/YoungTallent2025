//
//  HomePageMockAPIService.swift
//  YoungTallent2025Network
//
//  Prompted by Eser Küçüker using Cursor on 13.01.2025.
//

import Foundation
import API

struct HomePageMockAPIService: HomePageAPIServiceProtocol {
    func getMovies() async throws -> [MovieResponse] {
        // 5 mock movie data
        return [
            MovieResponse(title: "The Shawshank Redemption"),
            MovieResponse(title: "The Godfather"),
            MovieResponse(title: "The Dark Knight"),
            MovieResponse(title: "Pulp Fiction"),
            MovieResponse(title: "Forrest Gump")
        ]
    }
}