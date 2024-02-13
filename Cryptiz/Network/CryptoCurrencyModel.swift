//
//  CryptoCurrencyModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-08.
//

import Foundation

// CoinMarketCap
class Base: Codable {
    var data: [CryptoCoin]
    var status: Status
}

class CryptoCoin: Codable, Identifiable {
    var id: Int
    var name: String
    var symbol: String
    var quote: [String: Quote]

    var rate: String {
        let currentCurrency = UserSetting.shared.currency.rawValue
        guard let quotePrice = self.quote[currentCurrency]?.price else { return "N/A" }

        var decimals = Decimal.two
        if quotePrice < 1.0 { decimals = .four }
        let formatted = quotePrice.formatted(.currency(code: currentCurrency)
            .presentation(.narrow)
            .precision(.fractionLength(decimals.rawValue))
            .locale(.current)
        )
        return formatted
    }
}

class Quote: Codable {
    var price: Double
    var volume24H: Double?
    var percentChange1H: Double?
    var lastUpdated: String? // date, iso 8601
}

class Status: Codable {
    var timestamp: String
    var errorCode: Int?
    var errorMessage: String?
    var elapsed: Int
}
