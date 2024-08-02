//
//  CoverFlowView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.08.2024.
//

import SwiftUI

struct CoverFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {

    var itemWidth: CGFloat
    var items: Item
    var content: (Item.Element) -> Content

    var body: some View {
        GeometryReader {
            let size = $0.size

            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .frame(width: itemWidth)
                    }
                }
                .padding(.horizontal, (size.width - itemWidth) / 2)
            }
        }
    }
}

#Preview {
    CoverFlowContentView()
}
