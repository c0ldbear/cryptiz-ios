//
//  CoinsListView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-15.
//

import SwiftUI

struct CoinsListView: View {
    var coins: [CryptoCoin]

    var body: some View {
        List(coins) { crypto in
            NavigationLink {
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
    }
}
