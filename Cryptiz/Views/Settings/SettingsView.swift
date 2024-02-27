//
//  SettingsView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = SettingsViewModel()
    @Binding var exchangeCurrencyUpdated: Bool

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack {
                        Text("Select preferred currency")
                            .multilineTextAlignment(.leading)
                        Picker("Select Currency", selection: $viewModel.selectedCurrency) {
                            ForEach(viewModel.currencies, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    Divider()
                        .padding(.vertical, 16)

                    VStack {
                        Text("Select app language")
                            .multilineTextAlignment(.leading)

                        Picker("Select language", selection: $viewModel.selectedLanguage) {
                            ForEach(viewModel.languages, id: \.self) {
                                Text($0.string)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .padding()
                .background(Color(red: 0.17, green: 0.17, blue: 0.18))
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Spacer()

                PrimaryButton("Save Settings") {
                    saveSettings()
                }
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button {
                            saveSettings(false)
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundStyle(Color.Theme.primary)
                        }
                        .foregroundStyle(Color.primary)
                    }
                }
                .padding()
                .padding(.bottom, 32)
                .alert("Restart the app to change language",
                       isPresented: $viewModel.showAlertRestartApp) {
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

    private func saveSettings(_ saved: Bool = true) {
        guard saved else {
            exchangeCurrencyUpdated = false
            return
        }

        exchangeCurrencyUpdated = viewModel.saveSettings(onNoLanguageChange: {
            dismiss()
        })
    }
}

#Preview {
    SettingsView(exchangeCurrencyUpdated: .constant(false))
}
