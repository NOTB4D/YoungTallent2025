//
//  HomePageAPIServiceProtocol.swift
//  YoungTallent2025Network
//
//  Prompted by Eser Küçüker using Cursor on 13.01.2025.
//

import Foundation
import API

protocol HomePageAPIServiceProtocol {
    func getMovies() async throws -> [MovieResponse]
}