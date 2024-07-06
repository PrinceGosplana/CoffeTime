//
//  OffsetHelpers.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.06.2024.
//

import SwiftUI

extension View {
    /// Offset Extractor custom view modifier
    @ViewBuilder
    func offsetExtractor(coordinateSpace: String, completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .named(coordinateSpace))
                    Color.clear
                        .preference(key: OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self, perform: completion)
                }
            }
    }

    @ViewBuilder
    func elasticScroll(scrollRect: CGRect, screenSize: CGSize) -> some View {
        self
            .modifier(ElasticScrollHelper(scrollRect: scrollRect, screenSize: screenSize))
    }
}

fileprivate struct ElasticScrollHelper: ViewModifier {
    var scrollRect: CGRect
    var screenSize: CGSize
    @State private var viewRect: CGRect = .zero

    func body(content: Content) -> some View {
        let progress = scrollRect.minY / scrollRect.maxY
        /// if need more Elastic then adjust it's multiplier
        let elasticOffset = (progress * viewRect.minY) * 1.2
/// Bottom progress and bottom elasticOffset
        /// to start from zero simply remove 1 from the progress
        let bottomProgress = max(1 - (scrollRect.maxY / screenSize.height), 0)
        /// if you need more elastic then adjust it's multiplier
        let bottomElasticOffset = (viewRect.maxY * bottomProgress) * 1.2
        content
            .offset(y: scrollRect.minY > 0 ? elasticOffset : 0)
            .offset(y: scrollRect.minY > 0 ? -(progress * scrollRect.minY) : 0)
            .offset(y: scrollRect.maxY < screenSize.height ? bottomElasticOffset : 0)
//            .offset(y: scrollRect.maxY < screenSize.height ? (bottomProgress * scrollRect.maxY) : 0)
            .offsetExtractor(coordinateSpace: "SCROLLVIEW") {
                viewRect = $0
            }
    }
}
