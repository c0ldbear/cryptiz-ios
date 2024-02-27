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
        List(coins) { coin in
            NavigationLink {
                DetailCryptoCoinView(viewModel:
                                        DetailCryptoCoinViewModel(crypto: coin))
            } label: {
                CoinsListItemView(crypto: coin)
            }
        }
    }
}
