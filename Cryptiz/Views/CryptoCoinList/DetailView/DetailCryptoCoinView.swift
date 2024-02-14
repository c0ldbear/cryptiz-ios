//
//  DetailCryptoCoinView.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-13.
//

import SwiftUI

struct DetailCryptoCoinView: View {
    @State var viewModel: DetailCryptoCoinViewModel

    var body: some View {
        VStack {
            Text(viewModel.coin.name)
                .font(.largeTitle)
            HStack {
                Text("Latest price:")
                Spacer()
                Text("\(viewModel.coin.rate)")
            }
            .font(.title2)
        }
        .padding(.horizontal, 50)
        Spacer()
    }
}
