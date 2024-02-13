//
//  SettingsView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import SwiftUI

struct SettingsView: View {
    @State var selectedCurrency = "SEK"
    var currency = ["USD", "SEK"]

    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Text("Select preferred currency")
                        .multilineTextAlignment(.leading)
                    Picker("Select Currency", selection: $selectedCurrency) {
                        ForEach(currency, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    HStack{
                        Text("Selected:")
                        Spacer()
                        Text(selectedCurrency)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
