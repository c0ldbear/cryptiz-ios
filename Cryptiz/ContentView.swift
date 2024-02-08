//
//  ContentView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2023-10-31.
//

import SwiftUI

struct ContentView: View {
    @State var cryptoData = CryptoCurrencyMock.mockData
    @State private var searchCrypto: String = ""

    var searchResults: [CryptoCurrencyMock] {
        if searchCrypto.isEmpty {
            return cryptoData
        } else {
            return cryptoData.filter {
                $0.baseAsset.contains(searchCrypto.lowercased())
            }
        }
    }

    var body: some View {
        NavigationStack {
            // list all cryptos
            List(searchResults) { crypto in
                NavigationLink {
                    // Detailed view
                    VStack {
                        Text(crypto.baseAsset.uppercased())
                            .font(.largeTitle)
                        Text("₹\(crypto.lastPrice)")
                            .font(.title2)
                    }
                    Spacer()
                } label: {
                    HStack {
                        Text(crypto.baseAsset)
                        Spacer()
                        Text("₹\(crypto.lastPrice)")
                    }
                }
            }
            .navigationTitle("Cryptos")
        }
        .searchable(text: $searchCrypto,
                    prompt: Text("Find the crypto currency"))
    }
}

#Preview {
    ContentView()
}
