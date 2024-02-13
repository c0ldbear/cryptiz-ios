//
//  ContentView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2023-10-31.
//

import SwiftUI

struct CryptoCoinListView: View {
    @StateObject var viewModel = CryptoCoinListViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.large)
            } else {
                // list all cryptos
                List(viewModel.filteredCoins) { crypto in
                    NavigationLink {
                        // Detailed view
                        DetailCryptoCoinView(viewModel:
                                                DetailCryptoCoinViewModel(coin: crypto))
                    } label: {
                        HStack {
                            Text(crypto.name)
                            Spacer()
                            Text("\(crypto.rate)")
                        }
                    }
                }
                .toolbarTitleDisplayMode(.inlineLarge)
                .navigationTitle("Crypto Currencies")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewModel.showSettingsSheet.toggle()
                        } label: {
                            Image(systemName: SFSymbols.gear)
                        }
                        .foregroundStyle(Color.primary)
                    }
                }
                .sheet(isPresented: $viewModel.showSettingsSheet) {
                    fetchCoins()
                } content: {
                    SettingsView()
                }
            }
        }
        .searchable(text: $viewModel.searchCrypto,
                    prompt: Text("Find the crypto currency"))
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

#Preview {
    CryptoCoinListView()
}
