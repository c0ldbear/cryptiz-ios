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
    var noSearchResults = false

    var filteredCoins: [CryptoCoin] {
        if searchCrypto.isEmpty {
            return coins
        } else {
            let keyword = searchCrypto.lowercased()
            let searchResult = coins.filter { item in
                item.name.lowercased().contains(keyword) || item.symbol.lowercased().contains(keyword)
            }
            
            noSearchResults = searchResult.isEmpty

            return searchResult
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
