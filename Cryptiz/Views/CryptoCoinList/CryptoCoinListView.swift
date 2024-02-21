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
                // TODO: Add alert handling when error happens
                /// Show an alert when there is an error.

                viewModel.alertError = error.localizedDescription.description
                showErrorAlert.toggle()
                viewModel.state = .error(errorString: viewModel.alertError)
                print(">> error: \(viewModel.alertError)")
            }
        }
    }
}

private struct ErrorView: View {
    var error: String

    init(text error: String) {
        self.error = error
    }

    var body: some View {
        VStack {
            Image(systemName: SFSymbols.ladybug)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
            Text("Something went wrong!")
                .font(.title)
            Text("Error: \(error)")
                .font(.body)
                .foregroundStyle(Color(red: 0.73, green: 0.09, blue: 0.11))
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
