//
//  HomePageView.swift
//  YoungTallent2025Network
//
//  Prompted by Eser Küçüker using Cursor on 13.01.2025.
//

import SwiftUI
import API

struct HomePageView: View {
    @StateObject private var viewModel: HomePageViewModel
    
    init(apiService: HomePageAPIServiceProtocol = HomePageAPIService()) {
        self._viewModel = StateObject(wrappedValue: HomePageViewModel(apiService: apiService))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading movies...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                        Text("Error")
                            .font(.headline)
                            .foregroundColor(.red)
                        Text(errorMessage)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Retry") {
                            Task {
                                await viewModel.fetchMovies()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    List(viewModel.movies, id: \.title) { movie in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(movie.title ?? "Unknown Title")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 4)
                    }
                    .refreshable {
                        await viewModel.fetchMovies()
                    }
                }
            }
            .navigationTitle("Movies")
            .task {
                await viewModel.fetchMovies()
            }
        }
    }
}

#Preview {
    HomePageView(apiService: HomePageMockAPIService())
}