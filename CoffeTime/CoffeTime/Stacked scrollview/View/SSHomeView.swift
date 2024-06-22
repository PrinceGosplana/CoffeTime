//
//  SSHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct SSHomeView: View {
    var body: some View {
        VStack {
            StackedCards(
                items: SSItem.mockItems,
                stackedDisplayCount: 1,
                opacityDisplayCount: 0,
                itemHeight: 70) { item in
                    SSCardView(item: item)
                }
                .padding(.bottom, 20)
            
            BottomActionBar()
        }
        .padding(20)
    }
}

#Preview {
    SSContentView()
}
