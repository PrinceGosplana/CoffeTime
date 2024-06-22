//
//  StackedCards.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct StackedCards<Content: View, Data: RandomAccessCollection>: View where Data.Element: Identifiable {

    var items: Data
    var stackedDisplayCount: Int = 2
    var opacityDisplayCount: Int = 2
    var spacing: CGFloat = 5
    var itemHeight: CGFloat
    @ViewBuilder var content: (Data.Element) -> Content

    var body: some View {
        GeometryReader {
            let size = $0.size
            let topPadding: CGFloat = size.height - itemHeight

            ScrollView(.vertical) {
                VStack(spacing: spacing) {
                    ForEach(items) { item in
                        content(item)
                            .frame(height: itemHeight)
                            .visualEffect { content, geometryProxy in
                                content
                                    .opacity(opacity(geometryProxy))
                                    .scaleEffect(scale(geometryProxy), anchor: .bottom)
                                    .offset(y: offset(geometryProxy))
                            }
                            .zIndex(zIndex(item))
                    }
                }
                .scrollTargetLayout()
                .overlay(alignment: .top) {
                    SSHeader(topPadding: topPadding)
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            /// The reason for using safeAreaPadding instead of standard padding is that it adds padding directly to the scrollContent rather than the scrollview, allow us to scroll the stack and move it all the way to the top as it scrolls
            .safeAreaPadding(.top, topPadding)
        }

    }

    /// Zindex to reverse the Stack
    func zIndex(_ item: Data.Element) -> Double {
        if let index = items.firstIndex(where: { $0.id == item.id }) as? Int {
            return Double(items.count) - Double(index)
        }
        return 0
    }

    /// Offset & Scaling values for each item it look like a stack
    /// All cards moved up and formed a stack, but in reverse order, let us apply the Zindex modifier to move them in the correct direction
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let progress = minY / itemHeight
        let maxOffset = CGFloat(stackedDisplayCount) * offsetForEachItem
        let offset  = max(min(progress * offsetForEachItem, maxOffset), 0)
        
        return minY < 0 ? 0 : -minY + offset
    }

    func scale(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let progress = minY / itemHeight
        let maxScale = CGFloat(stackedDisplayCount) * scaleForEachItem
        let scale  = max(min(progress * scaleForEachItem, maxScale), 0)

        return 1 - scale
    }

    func opacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let progress = minY / itemHeight
        let opacityForItem = 1 / CGFloat(opacityDisplayCount + 1)

        let maxOpacity = CGFloat(opacityForItem) * CGFloat(opacityDisplayCount + 1)
        let opacity  = max(min(progress * scaleForEachItem, maxOpacity), 0)

        return progress < CGFloat(opacityDisplayCount + 1) ? 1 - opacity : 0
    }

    /// These properties will be used to move and scale the extra cards displayed on the stack. You can adjust them to suit your particular needs
    var offsetForEachItem: CGFloat { 8 }
    var scaleForEachItem: CGFloat { 0.08 }
}

#Preview {
    SSContentView()
}
