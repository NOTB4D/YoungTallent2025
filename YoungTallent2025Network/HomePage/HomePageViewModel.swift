//
//  HomePageViewModel.swift
//  YoungTallent2025Network
//
//  Prompted by Eser Küçüker using Cursor on 13.01.2025.
//

import Foundation
import API

@MainActor
class HomePageViewModel: ObservableObject {
    @Published var movies: [MovieResponse] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiService: HomePageAPIServiceProtocol
    
    init(apiService: HomePageAPIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedMovies = try await apiService.getMovies()
            movies = fetchedMovies
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}