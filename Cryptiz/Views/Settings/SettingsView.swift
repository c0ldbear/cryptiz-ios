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
    var currency: [ExchangeCurrency] = [.usd, .sek]

    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Text("Select preferred currency")
                        .multilineTextAlignment(.leading)
                    Picker("Select Currency", selection: $selectedCurrency) {
                        ForEach(currency, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    HStack{
                        Text("Selected:")
                        Spacer()
                        Text(selectedCurrency.rawValue)
                    }
                }
            }
            .navigationTitle("Settings")
            PrimaryButton("Save Settings") {
                dismiss()
            }
            .padding()
        }
        .onDisappear {
            UserSetting.shared.currency = selectedCurrency
        }
    }
}

#Preview {
    SettingsView()
}
