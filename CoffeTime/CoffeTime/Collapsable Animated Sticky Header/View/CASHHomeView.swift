//
//  CASHHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 18.09.2024.
//

import SwiftUI

struct CASHHomeView: View {

    let maxHeight = UIScreen.main.bounds.height / 2.3
    let topEdge: CGFloat
    @State private var offset: CGFloat = 0

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    CASHTopBar(
                        maxHeight: maxHeight,
                        topEdge: topEdge,
                        offset: $offset
                    )
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        /// Sticky effect
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                        .background(
                            Color.appYellow ?? .yellow,
                            in: CASHCustomCorner(corners: [.bottomRight], radius: getCornerRadius())
                        )
                        .overlay(
                            /// top nav view
                            HStack(spacing: 15) {
                                Button {

                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                }

                                Spacer()

                                Button {

                                } label: {
                                    Image(systemName: "line.3.horizontal.decrease")
                                        .font(.body.bold())
                                }
                            }
                                .padding(.horizontal)
                                .frame(height: 60)
                                .foregroundStyle(.white)
                                .padding(.top, topEdge)
                            , alignment: .top

                        )
                }
                .frame(height: maxHeight)
                .offset(y: -offset)
                .zIndex(1.0)

                VStack(spacing: 15){
                    ForEach(CASHMessage.mock) {
                        CASHMessageCardView(message: $0)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(CASHOffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }

    private func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }

    private func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value  * 50
        return offset < 0 ? radius : 50
    }
}

#Preview {
    CASHContentView()
}

