//
//  SettingsButton.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-14.
//

import SwiftUI


struct SettingsButton: View {
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: SFSymbols.gear)
        }
        .foregroundStyle(.primary)
        .scaleEffect(1.1)
    }
}

#Preview {
    SettingsButton {
        print(">> Settings Button Pressed!")
    }
}
