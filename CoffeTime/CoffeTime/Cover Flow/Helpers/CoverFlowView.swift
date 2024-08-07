//
//  CoverFlowView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.08.2024.
//

import SwiftUI

struct CoverFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {

    /// Customization properties
    var itemWidth: CGFloat
    var enableReflection: Bool = false
    var spacing: CGFloat = 0
    var rotation: Double
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
                            .reflection(enableReflection)
                            .visualEffect { content, geometryProxy in
                                content
                                    .rotation3DEffect(.init(degrees: rotation(geometryProxy)), axis: (x: 0, y: 1, z: 0), anchor: .center)
                            }
                            .padding(.trailing, item.id == items.last?.id ? 0 : spacing)
                    }
                }
                .padding(.horizontal, (size.width - itemWidth) / 2)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
        }
    }

    private func rotation(_ proxy: GeometryProxy) -> Double {
        let scrollViewWidth = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let midX = proxy.frame(in: .scrollView(axis: .horizontal)).midX
        /// Converting into progress
        let progress = midX / scrollViewWidth
        /// Limiting progress between 0 - 1
        let cappedProgress = max(min(progress, 1), 0)

        /// Limiting rotation between 0-90
        let cappedRotation = max(min(rotation, 90), 0)
        let degree = cappedProgress * (cappedRotation * 2)

        return cappedRotation - degree
    }
}

#Preview {
    CoverFlowContentView()
}
