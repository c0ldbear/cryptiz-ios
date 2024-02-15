//
//  CryptoCoinListViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation
import Observation

enum CryptoCoinListState {
    case loading
    case noSearchResult
    case results(coins: [CryptoCoin])
}

@Observable
class CryptoCoinListViewModel {
    private var coins = [CryptoCoin]()
    var searchCrypto = "" {
        didSet {
            filterCoinsBySearchKeyword()
        }
    }
    var showSettingsSheet = false
    var state: CryptoCoinListState = .loading

    @MainActor
    func fetchLatestCoins() async throws {
        //        state = .showResults(coins: [])
        state = .loading
        coins = try await NetworkManager.shared.fetchListingsLatestCoins()
        state = .results(coins: coins)
    }

    private func filterCoinsBySearchKeyword() {
        if searchCrypto.isEmpty {
            state = .results(coins: coins)
            return
        }

        let keyword = searchCrypto.lowercased()

        if case let .results(coins) = state {
            let searchResult = coins.filter { coin in
                coin.name.lowercased().contains(keyword) || coin.symbol.lowercased().contains(keyword)
            }

            if searchResult.isEmpty {
                state = .noSearchResult
            } else {
                state = .results(coins: searchResult)
            }
        }

    }
}
