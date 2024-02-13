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

    init(coin: CryptoCoin) {
        self.coin = coin
    }
}
