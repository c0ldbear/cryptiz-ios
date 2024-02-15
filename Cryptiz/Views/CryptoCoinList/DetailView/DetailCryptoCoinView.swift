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

            Text(viewModel.coin.symbol)
                .font(.title3)
                .foregroundStyle(Color.secondary)

            HStack {
                Text("Latest price:")
                Spacer()
                Text("\(viewModel.coin.rate)")
            }
            .font(.title2)
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 14)
        .background(Color(red: 0.17, green: 0.17, blue: 0.18))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 14)
        Spacer()
    }
}
