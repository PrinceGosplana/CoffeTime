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
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .background(
                            Color.appYellow ?? .yellow,
                            in: CASHCustomCorner(corners: [.bottomRight], radius: 50)
                        )
                }
                .frame(height: maxHeight)
            }
            .modifier(CASHOffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }
}

#Preview {
    CASHContentView()
}

