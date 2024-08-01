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

                HStack(spacing: 10) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .fill(inActiveTint)
                            .frame(width: 8, height: 8)
                    }
                }
                .frame(width: scrollViewWidth)
                .offset(x: -minX)
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    APIContentView()
}
