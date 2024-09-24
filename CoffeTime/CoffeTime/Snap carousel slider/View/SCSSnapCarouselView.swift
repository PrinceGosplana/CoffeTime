//
//  SCSSnapCarouselView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 24.09.2024.
//

import SwiftUI

struct SCSSnapCarouselView<Content: View, T: Identifiable>: View {

    let content: (T) -> Content
    let list: [T]

    /// properties
    let spacing: CGFloat
    let trailingSpace: CGFloat
    @Binding var index: Int

    @GestureState var offset: CGFloat = 0
    @State private var currentIndex: Int = 0
    init(
        items: [T],
        spacing: CGFloat = 15,
        trailingSpace: CGFloat = 100,
        index: Binding<Int>,
        content: @escaping (T) -> Content
    ) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }

    var body: some View {
        GeometryReader { proxy in

            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing

            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            /// setting only after 0th index
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        /// Updating current index
                        let offsetX = value.translation.width

                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)

                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width

                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
}

#Preview {
    SCSContentView()
}
