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
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .frame(width: itemWidth)
                }
            }
        }
    }
}

#Preview {
    CoverFlowContentView()
}
