//
//  ContentView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2023-10-31.
//

import SwiftUI

struct ContentView: View {
    @State private var searchCrypto: String = ""
    @State var coins = [CryptoCoin]()

    var body: some View {
        NavigationStack {
            // list all cryptos
            List(coins) { crypto in
                NavigationLink {
                    // Detailed view
                    VStack {
                        Text(crypto.name.uppercased())
                            .font(.largeTitle)
                        Text("\(String(crypto.quote["USD"]?.price ?? 0))")
                            .font(.title2)
                    }
                    Spacer()
                } label: {
                    HStack {
                        Text(crypto.name.uppercased())
                        Spacer()
                        Text("\(String(crypto.quote["USD"]?.price ?? 0))")
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
        .searchable(text: $searchCrypto,
                    prompt: Text("Find the crypto currency"))
        .task {
            do {
                coins = try await NetworkManager.shared.fetchListingsLatestCoins()
            } catch {
                print(">> Error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
