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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SideMenuContentView()
}
