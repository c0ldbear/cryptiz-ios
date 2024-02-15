//
//  CryptizApp.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2023-10-31.
//

import SwiftUI

@main
struct CryptizApp: App {

    var selectedLocale: String

    init() {
        selectedLocale = UserSetting.shared.language
    }

    var body: some Scene {
        WindowGroup {
            CryptoCoinListView()
                .environment(\.locale, .init(identifier: selectedLocale))
        }
    }
}
