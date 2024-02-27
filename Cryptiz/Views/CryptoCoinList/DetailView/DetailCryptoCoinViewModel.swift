//
//  DetailCryptoCoinViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Observation

@Observable
class DetailCryptoCoinViewModel {
    var coin: CryptoCoin

    init(crypto: CryptoCoin) {
        self.coin = crypto
    }
}
