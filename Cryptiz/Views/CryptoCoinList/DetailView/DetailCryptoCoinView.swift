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
            Text("\(viewModel.coin.rate)")
                .font(.title2)
        }
        Spacer()
    }
}
