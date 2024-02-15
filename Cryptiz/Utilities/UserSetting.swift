//
//  ExchangeCurrency.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import Foundation

// MARK: - User Setting
class UserSetting {
    static let shared = UserSetting()

    private init() {}

    var currency: ExchangeCurrency {
        get {
            let storedValue = UserDefaults.standard.string(forKey: Keys.currency) ?? ExchangeCurrency.usd.rawValue
            if let storedCurrency = ExchangeCurrency(rawValue: storedValue) {
                return storedCurrency
            }
            return .usd
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.currency)
        }
    }

    var language: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.language) ?? "en"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.language)
        }
    }
}
