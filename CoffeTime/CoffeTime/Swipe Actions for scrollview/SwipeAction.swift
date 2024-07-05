//
//  SwipeAction.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.07.2024.
//

import SwiftUI

struct SwipeAction<Content: View>: View {

    @ViewBuilder var content: Content

    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    content
                    /// to take full available space
                        .containerRelativeFrame(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}
