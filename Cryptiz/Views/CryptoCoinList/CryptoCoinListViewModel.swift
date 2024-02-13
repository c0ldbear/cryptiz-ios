//
//  CryptoCoinListViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation

enum Decimal: Int {
    case two   = 100
    case three = 1000
    case four  = 10_000
    case six   = 1_000_000
}

class CryptoCoinListViewModel: ObservableObject {
    @Published var coins = [CryptoCoin]()
    @Published var searchCrypto = ""

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
        var formatted = quotePrice.formatted(.currency(code: "usd")
            .presentation(.narrow)
            .precision(.fractionLength(decimals.rawValue))
            .locale(.current)
        )
        return formatted
    }
}
