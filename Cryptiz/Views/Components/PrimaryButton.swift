//
//  PrimaryButton.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-14.
//

import SwiftUI

struct PrimaryButton: View {
    var title: LocalizedStringResource
    var action: () -> Void

    init(_ title: LocalizedStringResource, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button{
            action()
        } label: {
            Text(title)
                .font(.title3)
                .bold()
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

private struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 20)
            .padding(.horizontal, 80)
            .foregroundStyle(Color.black)
            .background(Color.Theme.primary)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.2 : 1)
            .animation(.easeOut(duration: 0.1),
                       value: configuration.isPressed)
    }
}

#Preview {
    PrimaryButton("Primary Button") {
        print(">> Primary Button Pressed!")
    }
}
