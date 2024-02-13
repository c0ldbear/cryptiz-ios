//
//  CryptoCoinListViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation

enum Decimal: Int {
    case two   = 2
    case three = 3
    case four  = 4
    case six   = 6
}

class CryptoCoinListViewModel: ObservableObject {
    @Published var coins = [CryptoCoin]()
    @Published var searchCrypto = ""
    @Published var showSettingsSheet = false

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
    init() {
        self.fetchLatestCoins()
    }

    @MainActor
    func fetchLatestCoins() {
        Task {
            do {
                coins = try await NetworkManager.shared.fetchListingsLatestCoins()
            } catch {
                print(">> Error: \(error)")
            }
        }
    }

    func coinPrice(_ quotePrice: Double?) -> String {
        guard let quotePrice = quotePrice else { return "N/A" }

        var decimals = Decimal.two
        if quotePrice < 1.0 { decimals = .four }
        let formatted = quotePrice.formatted(.currency(code: "usd")
            .presentation(.narrow)
            .precision(.fractionLength(decimals.rawValue))
            .locale(.current)
        )
        return formatted
    }
}
