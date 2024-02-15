//
//  LoadingView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-15.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .controlSize(.large)
    }
}

#Preview {
    LoadingView()
}
