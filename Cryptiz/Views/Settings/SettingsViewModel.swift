//
//  SettingsViewModel.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-15.
//

import Foundation
import Observation

@Observable
class SettingsViewModel {
    var selectedCurrency = UserSetting.shared.currency
    var selectedLanguage = UserSetting.shared.language
    var showAlertRestartApp = false

    var currencies: [ExchangeCurrency] { ExchangeCurrency.allCases }
    var languages: [AppLanguage] { AppLanguage.allCases }

    func saveSettings(onNoLanguageChange action: @escaping () -> Void) {
        UserSetting.shared.currency = selectedCurrency
        if selectedLanguage != UserSetting.shared.language {
            UserSetting.shared.language = selectedLanguage
            showAlertRestartApp = true
        } else {
            action()
        }
    }
}
