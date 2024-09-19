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
                    CASHTopBar(topEdge: topEdge, offset: $offset)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        /// Stricky effect
                        .frame(height: maxHeight + offset, alignment: .bottom)
                        .background(
                            Color.appYellow ?? .yellow,
                            in: CASHCustomCorner(corners: [.bottomRight], radius: 50)
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
                                .frame(height: 80 + topEdge)
                                .foregroundStyle(.white)
                            , alignment: .top

                        )
                }
                .frame(height: maxHeight)
                .offset(y: -offset)

                VStack(spacing: 15){
                    ForEach(CASHMessage.mock) {
                        CASHMessageCardView(message: $0)
                    }
                }
            }
            .modifier(CASHOffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }
}

#Preview {
    CASHContentView()
}

