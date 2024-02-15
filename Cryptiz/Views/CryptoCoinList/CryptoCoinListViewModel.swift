//
//  CryptoCoinListViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation
import Observation

@Observable
class CryptoCoinListViewModel {
    var coins = [CryptoCoin]()
    var searchCrypto = ""
    var showSettingsSheet = false
    var isLoading = false

    var filteredCoins: [CryptoCoin] {
        if searchCrypto.isEmpty {
            return coins
        } else {
            let keyword = searchCrypto.lowercased()
            return coins.filter { item in
                item.name.lowercased().contains(keyword) || item.symbol.lowercased().contains(keyword)
            }
        }
    }

    @MainActor
    func fetchLatestCoins() async throws {
        coins = []
        isLoading = true
        coins = try await NetworkManager.shared.fetchListingsLatestCoins()
        isLoading = false
    }
}
