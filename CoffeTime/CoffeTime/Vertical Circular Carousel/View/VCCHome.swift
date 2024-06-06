//
//  VCCHome.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 06.06.2024.
//

import SwiftUI

struct VCCHome: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(Card.mockCards) { card in
                        VCCCardView(card: card)
                            .frame(width: 220, height: 150)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        VCCContentView()
    }
}
