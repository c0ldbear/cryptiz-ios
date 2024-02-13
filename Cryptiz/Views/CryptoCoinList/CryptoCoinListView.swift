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
            // list all cryptos
            List(viewModel.filteredCoins) { crypto in
                NavigationLink {
                    // Detailed view
                    VStack {
                        Text(crypto.name.uppercased())
                            .font(.largeTitle)
                        Text("\(viewModel.coinPrice(crypto.quote["USD"]?.price))")
                            .font(.title2)
                    }
                    Spacer()
                } label: {
                    HStack {
                        Text(crypto.name.uppercased())
                        Spacer()
                        Text("\(viewModel.coinPrice(crypto.quote["USD"]?.price))")
                    }
                }
            }
            .toolbarTitleDisplayMode(.inlineLarge)
            .navigationTitle("Crypto Currencies")
            .toolbar {
                ToolbarItem {
                    Button {
                        // Placeholder for action when pressing the gear icon (Open Settings)
                        print(">> Settings shown as a modal or fullscreen?")
                    } label: {
                        Image(systemName: "gear")
                    }
                    .foregroundStyle(Color.primary)
                }
            }
        }
        .searchable(text: $viewModel.searchCrypto,
                    prompt: Text("Find the crypto currency"))
    }
}

#Preview {
    CryptoCoinListView()
}
