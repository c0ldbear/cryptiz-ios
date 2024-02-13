//
//  Constants.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation

struct Keys {
    static let currency = "currency"
}

struct SFSymbols {
    static let gear = "gear"
}

enum ExchangeCurrency: String {
    case sek = "SEK"
    case usd = "USD"
}

enum Decimal: Int {
    case two   = 2
    case three = 3
    case four  = 4
    case six   = 6
}
