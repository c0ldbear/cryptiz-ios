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
                        HStack {
                            Text("Selected:")
                            Spacer()
                            Text(viewModel.selectedCurrency.rawValue)
                        }
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
                        HStack {
                            Text("Selected:")
                            Spacer()
                            Text(viewModel.selectedLanguage.rawValue)
                        }
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .padding()
                .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Spacer()

                PrimaryButton("Save Settings") {
                    viewModel.saveSettings(onNoLanguageChange: {
                        dismiss()
                    })
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
}

#Preview {
    SettingsView()
}
