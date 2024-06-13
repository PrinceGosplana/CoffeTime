//
//  ParallaxImageView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.06.2024.
//

import SwiftUI

struct ParallaxImageView<Content: View>: View {

    var maximumMovement: CGFloat = 100
    var userFullWidth: Bool = false

    @ViewBuilder var content: (CGSize) -> Content

    var body: some View {
        GeometryReader {
            let size = $0.size

            /// Movement animation properties
            let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
            /// with the new named coordinate space we can read the scrollview's height without the use of GeometryReader
            let scrollViewHeight = $0.bounds(of: .scrollView)?.size.height ?? 0
            /// It returns the scrollview height. Using this height together with minY, we can define a progress range of 0 to 1, which will allow us to move the image and give us the parallax effect
            let maximumMovement = min(maximumMovement, (size.height * 0.3))
            let stretchedSize: CGSize = .init(width: size.width, height: size.height + maximumMovement)

            let progress = minY / scrollViewHeight
            let cappedProgress = max(min(progress, 1.0), -1.0)
            let movementOffset = cappedProgress * -maximumMovement

            content(size)
                .offset(y: movementOffset)
                .frame(width: stretchedSize.width, height: stretchedSize.height)
                .frame(width: size.width, height: size.height)
                .clipped()
        }
        .containerRelativeFrame(userFullWidth ? [.horizontal] : [])
    }
}
