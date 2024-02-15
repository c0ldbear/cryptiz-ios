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

#Preview {
    CryptoCoinListView()
}
