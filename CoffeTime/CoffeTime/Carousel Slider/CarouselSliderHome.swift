//
//  CarouselSliderHome.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.08.2024.
//

import SwiftUI

struct CarouselSliderHome: View {

    @State private var cards = CSCard.mockCards

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(cards) {
                        CardView($0)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .clipShape(.rect(cornerRadius: 25))
            .padding(.horizontal, 15)
            .padding(.top, 30)

            Spacer()
        }
    }

    /// card view
    @ViewBuilder
    func CardView(_ card: CSCard) -> some View {
        GeometryReader {
            let size = $0.size

            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 25))
        }
        .frame(width: 180, height: 200)
    }
}

#Preview {
    CarouselSliderContentView()
}
