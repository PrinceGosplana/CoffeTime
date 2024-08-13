//
//  SHHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import SwiftUI

struct SHHomeView: View {

    let size: CGSize
    let safeArea: EdgeInsets
    @State private var offsetY: CGFloat = 0

    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    HeaderView()
                        .zIndex(1000)

                    SHSampleCardsView()
                        .padding(.horizontal)
                }
                .id("SCROLL")
                .background {
                    ScrollDetector { offset in
                        offsetY = -offset
                    } onDraggingEnd: { offset, velocity in
                        /// reseting to initial state if not completely scrolled
                        let headerHeight = (size.height * 0.5) + safeArea.top 
                        let minimumHeaderHeight = 65 + safeArea.top

                        let targetEnd = offset + (velocity * 45)

                        if targetEnd < (headerHeight - minimumHeaderHeight) && targetEnd > 0 {
                            withAnimation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.65)) {
                                scrollProxy.scrollTo("SCROLL", anchor: .top)
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    func HeaderView() -> some View {
        let headerHeight = (size.height * 0.4) + safeArea.top
        let minimumHeaderHeight = 65 + safeArea.top

        /// Converting offset into progress
        /// Limiting it to 0 -1
        let progress = max(min (-offsetY / (headerHeight - minimumHeaderHeight), 1), 0)

        GeometryReader { _ in
            ZStack {
                Rectangle().fill(.black)

                VStack(spacing: 10) {
                    GeometryReader {
                        let rect = $0.frame(in: .global)

                        /// Since scaling of the Image is 0.3 (1 - 0.7)
                        let halfScaleHeight = (rect.height * 0.3) * 0.5
                        let midY = rect.midY
                        let bottomPadding: CGFloat = 15
                        let resizedOffsetY = (midY - (minimumHeaderHeight - halfScaleHeight - bottomPadding))

                        Image(.girl6)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            /// scaling image
                            .scaleEffect(1 - (progress * 0.7), anchor: .leading)
                            /// moving scaled image to center leading
                            .offset(x: -(rect.minX - 15) * progress, y: -resizedOffsetY * progress)
                    }
                    .frame(width: headerHeight * 0.5, height: headerHeight * 0.5)

                    Text("Chapter 1")
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                        .scaleEffect(1 - (progress * 0.15))
                        .offset(y: -4.5 * progress)

                    Text("Online")
                        .foregroundStyle(.green)
                        .scaleEffect(1 - (progress * 0.15))
                        .offset(y: -4.5 * progress)
                }
                .padding(.top, safeArea.top)
                .padding(.bottom, 15)
            }
            .frame(height: (headerHeight + offsetY) < minimumHeaderHeight ? minimumHeaderHeight : (headerHeight + offsetY), alignment: .bottom)
            .offset(y: -offsetY)
        }
        .frame(height: headerHeight)
    }
}

#Preview {
    SHContentView()
}
