//
//  PagingIndicator.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.08.2024.
//

import SwiftUI

struct PagingIndicator: View {
    var activeTint: Color = .primary
    var inActiveTint: Color = .primary.opacity(0.15)
    var opacityEffect: Bool = false
    var clipEdges: Bool = false

    var body: some View {
        GeometryReader {
            /// Entire view size for calculating page
            let width = $0.size.width

            if let scrollViewWidth = $0.bounds(of: .scrollView(axis: .horizontal))?.width, scrollViewWidth > 0 {
                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                let totalPages = Int(width / scrollViewWidth)

                /// Progress
                let freeProgress = -minX / scrollViewWidth
                let clippedProgress = min(max(freeProgress, 0.0), 1.0)
                let progress = clipEdges ? clippedProgress : freeProgress

                /// Indexes
                let activeIndex = Int(progress)
                /// this will provide the upcoming index that is being scrolled, with this we can expand the indicator of the next page and minimize the indicator size of the current page
                let nextIndex = Int(progress.rounded(.awayFromZero))
                let indicatorProgress = progress - CGFloat(activeIndex)
                /// Indicator width's (current & upcoming)
                let currentPageWidth = 18 - (indicatorProgress * 18)
                let nextPageWidth = indicatorProgress * 18

                HStack(spacing: 10) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Capsule()
                            .fill(inActiveTint)
                            .frame(width: 8 + (activeIndex == index ? currentPageWidth : nextIndex == index ? nextPageWidth : 0), height: 8)
                            .overlay {
                                ZStack {
                                    Capsule()
                                        .fill(inActiveTint)
                                    Capsule()
                                        .fill(activeTint)
                                        .opacity(opacityEffect ? activeIndex == index ? 1 - indicatorProgress : nextIndex == index ? nextPageWidth : 0 : 1)
                                }
                            }
                    }
                }
                .frame(width: scrollViewWidth)
                .overlay {
                    Text("active \(activeIndex) next \(nextIndex)")
                        .font(.title)
                        .foregroundStyle(.white)
                        .offset(y: -100)
                }
                .offset(x: -minX)
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    APIContentView()
}
