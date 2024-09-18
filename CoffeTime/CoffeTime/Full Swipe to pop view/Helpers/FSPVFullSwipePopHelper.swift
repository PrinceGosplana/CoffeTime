//
//  FSPVFullSwipePopHelper.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 17.09.2024.
//

import SwiftUI

struct FSPVFullSwipePopHelper<MainContent: View, Content: View>: View {
    let mainContent: MainContent
    let content: Content
    @Binding var show: Bool

    @GestureState var gestureOffset: CGFloat = 0
    @State private var offset: CGFloat = 0

    @Environment(\.colorScheme) var colorScheme

    init(mainContent: MainContent, content: Content, show: Binding<Bool>) {
        self.mainContent = mainContent
        self.content = content
        self._show = show
    }

    var body: some View {
        GeometryReader { proxy in
            mainContent
            /// Moving main content slightly
                .offset(x: show && offset >= 0 ? getOffset(size: proxy.size.width) : 0)
                .overlay(
                    ZStack {
                        if show {
                            content
                                .background(
                                    (colorScheme == .dark ? Color.black : Color.white)
                                        .shadow(radius: 1.3)
                                        .ignoresSafeArea()
                                )
                                .offset(x: max(offset, 0))
                                .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                                    out = value.translation.width
                                }).onEnded({ value in
                                    withAnimation(.linear.speed(2)) {
                                        offset = 0

                                        let translation = value.translation.width
                                        let maxtranslation = proxy.size.width / 2.5
                                            
                                        show = translation < maxtranslation

                                    }
                                }))
                                .transition(.move(edge: .trailing))
                        }
                    }
                )
                .onChange(of: gestureOffset) { oldValue, newValue in
                    offset = gestureOffset
                }
        }
    }

    private func getOffset(size: CGFloat) -> CGFloat {
        let progress = offset / size

        /// Were slightly moving the view 80 towards left side and getting back to 8 based on user drag
        let start: CGFloat = -80
        let progressWidth = (progress * 90) <= 90 ? (progress * 90) : 90
        let mainOffset = (start + progressWidth) < 0 ? (start + progressWidth) : 0

        return mainOffset
    }
}
