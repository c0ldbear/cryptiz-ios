//
//  CryptoCurrencyModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-08.
//

import Foundation

class CryptoCurrency: Codable {
    var symbol: String
    var baseAsset: String
    var quoteAsset: String
    var openPrice: String
    var lowPrice: String
    var highPrice: String
    var lastPrice: String
    var volume: String
    var bidPrice: String
    var askPrice: String
    var at: Int
}

struct CryptoCurrencyMock: Identifiable {
    var id = UUID()
    var symbol: String
    var baseAsset: String
    var quoteAsset: String
    var openPrice: String
    var lowPrice: String
    var highPrice: String
    var lastPrice: String
    var volume: String
    var bidPrice: String
    var askPrice: String
    var at: Int

    static var mockData: [Self] = [
        .init(symbol: "bitcinr", baseAsset: "btc", quoteAsset: "inr", openPrice: "3777500", lowPrice: "3772500.0", highPrice: "3951611.0", lastPrice: "3951661.0", volume: "6.56019", bidPrice: "3951184.0", askPrice: "3951611.0", at: 1707406746000),
        .init(symbol: "xrpinr", baseAsset: "xrp", quoteAsset: "inr", openPrice: "44.2", lowPrice: "43.98", highPrice: "45.2", lastPrice: "45.11", volume: "135668.2", bidPrice: "45.11", askPrice: "45.2", at: 1707406746000),
        .init(symbol: "ethinr", baseAsset: "eth", quoteAsset: "inr", openPrice: "207301", lowPrice: "20600.0", highPrice: "214000.0", lastPrice: "214000.0", volume: "38.993", bidPrice: "214031.0", askPrice: "214500.0", at: 1707406746000),
        .init(symbol: "trxinr", baseAsset: "trx", quoteAsset: "inr", openPrice: "11.0379", lowPrice: "10.5505", highPrice: "11.12", lastPrice: "10.73", volume: "586037.0", bidPrice: "10.73", askPrice: "10.735", at: 1707406746000),
        .init(symbol: "eosinr", baseAsset: "eos", quoteAsset: "inr", openPrice: "80.07", lowPrice: "79.13", highPrice: "82.99", lastPrice: "79.13", volume: "207.69", bidPrice: "79.13", askPrice: "80.0", at: 1707406746000)]
}
