//
//  ContentView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2023-10-31.
//

import SwiftUI

struct CryptoCoinListView: View {
    @State var viewModel = CryptoCoinListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .loading:
                    LoadingView()
                case .noSearchResult:
                    NoSearchResultsView()
                case .results(let coins): 
                    // List all crypto currencies
                    CoinsListView(coins: coins)
                        .sheet(isPresented: $viewModel.showSettingsSheet) {
                            fetchCoins()
                        } content: {
                            SettingsView()
                        }
                }
            }
            .toolbar {
                ToolbarItem {
                    SettingsButton {
                        viewModel.showSettingsSheet.toggle()
                    }
                }
            }
            .toolbarTitleDisplayMode(.inlineLarge)
            .navigationTitle("Crypto Currencies")
            .refreshable {
                fetchCoins()
            }
            .searchable(text: $viewModel.searchCrypto,
                        prompt: Text("Find crypto currency"))
        }
        .onAppear {
            fetchCoins()
        }
    }

    private func fetchCoins() {
        Task {
            do {
                try await viewModel.fetchLatestCoins()
            } catch {
                print(">> error: \(error)")
            }
        }
    }
}

private struct NoSearchResultsView: View {
    var body: some View {
        Text("No cryptos found.")
            .font(.title2)
            .foregroundStyle(Color.secondary)
            .padding()
        Spacer()
    }
}

#Preview {
    CryptoCoinListView()
}
