//
//  Constants.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation

struct Keys {
    static let currency = "currency"
    static let language = "language"
}

struct SFSymbols {
    static let gear = "gear"
    static let ladybug = "ladybug.circle"
}

struct InfoPlistKeys {
    static let apiKey = "APIKey"
    static let baseURL = "BaseURL"
}

enum ExchangeCurrency: String, CaseIterable {
    case eur = "EUR"
    case sek = "SEK"
    case usd = "USD"
}

enum AppLanguage: String, CaseIterable {
    case en = "en"
    case sv = "sv"

    var string: String {
        switch self {
        case .en:
            "English"
        case .sv:
            "Svenska"
        }
    }
}

enum Decimal: Int {
    case two   = 2
    case three = 3
    case four  = 4
    case six   = 6
}
