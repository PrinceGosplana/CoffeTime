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
                            .visualEffect { content, geometryProxy in
                                content
                                    .offset(x: -150)
                                    .rotationEffect(
                                        .init(
                                            degrees: cardRotation(geometryProxy)
                                        ),
                                        anchor: .trailing
                                    )
                                    .offset(x: 100, y: -geometryProxy.frame(in: .scrollView(axis: .vertical)).minY)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.vertical, (size.height * 0.5) - 75)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .background {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: size.height, height: size.height)
                    .offset(x: size.height / 2)
            }

            VStack(alignment: .leading, spacing: 12) {
                Button {

                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title3.bold())
                        .foregroundStyle(Color.primary)
                }

                Text("Total")
                    .font(.title3.bold())
                    .padding(.top, 10)

                Text("$998.00")
                    .font(.largeTitle)

                Text("Choose a card")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .padding(15)
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    /// Card rotation
    private func cardRotation(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let height = proxy.size.height

        let progress = minY / height
        let angleForEachCard: CGFloat = -50
        let cappedProgress = progress < 0 ? min(max(progress, -3), 0) : (min(progress, 3))

        return cappedProgress * angleForEachCard
    }
}

#Preview {
    NavigationStack {
        VCCContentView()
    }
}
