//
//  CoinsListItemView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-27.
//

import SwiftUI

struct CoinsListItemView: View {
    var crypto: CryptoCoin

    var body: some View {
        HStack {
            Text(crypto.name)
            Spacer()
            Text("\(crypto.rate)")
        }
    }
}
