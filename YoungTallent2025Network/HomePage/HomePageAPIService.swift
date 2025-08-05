//
//  HomePageAPIService.swift
//  YoungTallent2025Network
//
//  Prompted by Eser Küçüker using Cursor on 13.01.2025.
//

import Foundation
import API

struct HomePageAPIService: HomePageAPIServiceProtocol {
    func getMovies() async throws -> [MovieResponse] {
        let response: [MovieResponse] = try await API.Movie.getMovie.fetch()
        return response
    }
}