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

    var body: some View {
        GeometryReader {
            let size = $0.size
            let saveArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets ?? .zero
            HStack(spacing: 0) {
                GeometryReader { _ in
                    menuView(saveArea)
                }
                .frame(width: sideMenuWidth)

                GeometryReader { _ in
                    content(saveArea)
                }
                .frame(width: size.width)
            }
            .frame(width: size.width + sideMenuWidth, height: size.height)
            .offset(x: -sideMenuWidth)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SideMenuContentView()
}
