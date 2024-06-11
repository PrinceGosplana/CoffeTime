//
//  AnimatedSideBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 11.06.2024.
//

import SwiftUI

struct AnimatedSideBar<Content: View, MenuView: View, Background: View>: View {

    /// Customization options
    var rotatesWhenExpands: Bool = true
    var disablesInteraction: Bool = true
    var sideMenuWidth: CGFloat = 200
    var cornerRadius: CGFloat = 25

    @Binding var showMenu: Bool

    @ViewBuilder var content: (UIEdgeInsets) -> Content
    @ViewBuilder var menuView: (UIEdgeInsets) -> MenuView
    @ViewBuilder var background: Background

    @GestureState private var isDragging: Bool = false
    @State private var offsetX: CGFloat = 0
    @State private var lastOffsetX: CGFloat = 0

    var body: some View {
        GeometryReader {
            let size = $0.size
            let saveArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets ?? .zero
            HStack(spacing: 0) {
                GeometryReader { _ in
                    menuView(saveArea)
                }
                .frame(width: sideMenuWidth)

                /// Clipping menu interaction beyond it's width
                .contentShape(.rect)

                GeometryReader { _ in
                    content(saveArea)
                }
                .frame(width: size.width)
            }
            .frame(width: size.width + sideMenuWidth, height: size.height)
            .offset(x: -sideMenuWidth)
            .offset(x: offsetX)
            .contentShape(.rect)
            .gesture(dragGesture)
        }
        .ignoresSafeArea()
    }

    /// Drag gesture
    var dragGesture: some Gesture {
        DragGesture()
            .updating($isDragging) { _, out, _ in
                out = true
            }.onChanged { value in
                let translationX = isDragging ? max(min(value.translation.width * lastOffsetX, sideMenuWidth), 0) : 0
                offsetX = translationX
            }.onEnded { value in
                withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                    let velocityX = value.velocity.width / 8
                    let total = velocityX + offsetX

                    if total > (sideMenuWidth * 0.6) {

                    } else {
                        reset()
                    }
                }
            }
    }

    /// Reset's to it's initial state
    func reset() {
        offsetX = 0
        lastOffsetX = 0
        showMenu = false
    }
}

#Preview {
    SideMenuContentView()
}
