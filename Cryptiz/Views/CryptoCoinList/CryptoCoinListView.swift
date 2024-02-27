//
//  ContentView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2023-10-31.
//

import SwiftUI

struct CryptoCoinListView: View {
    @Environment(\.dismiss) var dismiss
    @State var showErrorAlert = false
    @State var viewModel = CryptoCoinListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .error(let errorString):
                    ErrorView(text: errorString)
                case .loading:
                    LoadingView()
                        .onAppear {
                            fetchCoins()
                        }
                case .noSearchResult:
                    NoSearchResultsView()
                case .results(let coins):
                    // List all crypto currencies
                    CoinsListView(coins: coins)
                }
            }
            .sheet(isPresented: $viewModel.showSettingsSheet) {
                if viewModel.exchangeCurrencyUpdated {
                    fetchCoins()
                }
            } content: {
                SettingsView(exchangeCurrencyUpdated: $viewModel.exchangeCurrencyUpdated)
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
            .alert(viewModel.alertError,
                   isPresented: $showErrorAlert) {
                Button {
                    dismiss()
                } label: {
                    Text("OK")
                }
            }
        }
        .tint(Color.white)
    }

    private func fetchCoins() {
        Task {
            do {
                try await viewModel.fetchLatestCoins()
            } catch {
                viewModel.alertError = error.localizedDescription.description
                showErrorAlert.toggle()
                viewModel.state = .error(errorString: viewModel.alertError)
                print(">> error: \(viewModel.alertError)")
            }
        }
    }
}

#Preview {
    CryptoCoinListView()
}
