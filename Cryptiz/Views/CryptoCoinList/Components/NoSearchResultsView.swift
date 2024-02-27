//
//  NoSearchResultsView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-27.
//

import SwiftUI

struct NoSearchResultsView: View {
    var body: some View {
        Text("No cryptos found.")
            .font(.title2)
            .foregroundStyle(Color.secondary)
            .padding()
        Spacer()
    }
}
