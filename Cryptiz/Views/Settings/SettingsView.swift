//
//  SettingsView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency = UserSetting.shared.currency
    @State var selectedLanguage = UserSetting.shared.language
    @State var showAlertRestartApp = false

    var currency: [ExchangeCurrency] = [.usd, .sek]
    var languages: [String] {
        // check available languages in the user's phone
        guard let availableLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String] else {
            return []
        }
        return availableLanguages
    }

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack {
                        Text("Select preferred currency")
                            .multilineTextAlignment(.leading)
                        Picker("Select Currency", selection: $selectedCurrency) {
                            ForEach(currency, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Selected:")
                            Spacer()
                            Text(selectedCurrency.rawValue)
                        }
                    }

                    if languages.count > 1 {
                        Divider()
                            .padding(.vertical, 16)

                        VStack {
                            Text("Select app language")
                                .multilineTextAlignment(.leading)

                            if languages.count < 3 {
                                Picker("Select language", selection: $selectedLanguage) {
                                    ForEach(languages, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                            } else {
                                Picker("Select language", selection: $selectedLanguage) {
                                    ForEach(languages, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            HStack {
                                Text("Selected:")
                                Spacer()
                                Text(selectedLanguage)
                            }
                        }
                        .navigationTitle("Settings")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding()
                .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Spacer()

                PrimaryButton("Save Settings") {
                    UserSetting.shared.currency = selectedCurrency
                    if selectedLanguage != UserSetting.shared.language {
                        UserSetting.shared.language = selectedLanguage
                        showAlertRestartApp = true
                    } else {
                        dismiss()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        .foregroundStyle(Color.primary)
                    }
                }
                .padding()
                .padding(.bottom, 32)
                .alert("Restart the app to change language", isPresented: $showAlertRestartApp) {
                    Button {
                        dismiss()
                    } label: {
                        Text("OK")
                    }

                }
            }
            .padding()
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    SettingsView()
}
