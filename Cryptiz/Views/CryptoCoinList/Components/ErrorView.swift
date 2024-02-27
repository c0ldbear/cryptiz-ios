//
//  ErrorView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-27.
//

import SwiftUI

struct ErrorView: View {
    var error: String

    init(text error: String) {
        self.error = error
    }

    var body: some View {
        VStack {
            Image(systemName: SFSymbols.ladybug)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
            Text("Something went wrong!")
                .font(.title)
            Text("Error: \(error)")
                .font(.body)
                .foregroundStyle(Color(red: 0.73, green: 0.09, blue: 0.11))
        }
    }
}
