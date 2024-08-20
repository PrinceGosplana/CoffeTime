//
//  CarouselSliderHome.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.08.2024.
//

import SwiftUI

struct CarouselSliderHome: View {

    @State private var cards = CSCard.mockCards
    private let cardWidth: CGFloat = 100

    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size

                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(cards) {
                            CardView($0)
                        }
                    }
                    .padding(.trailing, size.width - 180)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .clipShape(.rect(cornerRadius: 25))
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            .frame(height: 210)

            Spacer(minLength: 0)
        }
    }

    /// card view
    @ViewBuilder
    func CardView(_ card: CSCard) -> some View {
        GeometryReader {
            let size = $0.size
            let minX = $0.frame(in: .scrollView).minX
            /// 190: 180 - Card width; 10 - is a spacing
            let reducingWidth = (minX / 190) * cardWidth
            let cappedWidth = min(reducingWidth, cardWidth)

            let frameWidth = size.width - (minX > 0 ? cappedWidth : -cappedWidth)

            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .frame(width: frameWidth < 0 ? 0 : frameWidth)
                .clipShape(.rect(cornerRadius: 25))
                .offset(x: minX > 0 ? 0 : -cappedWidth)
                .offset(x: -card.previousOffset)
        }
        .frame(width: 180, height: 200)
        .offsetX { offset in
            let reducingWidth = (offset / 190) * cardWidth
            let index = cards.indexOf(card)

            if cards.indices.contains(index + 1) {
                cards[index + 1].previousOffset = (offset < 0 ? 0 : reducingWidth)
            }
        }
    }
}

#Preview {
    CarouselSliderContentView()
}
