//
//  CryptoCoinListViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation

class CryptoCoinListViewModel: ObservableObject {
    @Published var coins = [CryptoCoin]()
    @Published var searchCrypto = ""
    @Published var showSettingsSheet = false
    @Published var isLoading = false

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
