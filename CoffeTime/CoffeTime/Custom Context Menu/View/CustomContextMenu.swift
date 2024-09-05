//
//  CustomContextMenu.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.09.2024.
//

import SwiftUI

struct CustomContextMenu<Content: View, Preview: View>: View {

    private var content: Content
    private var preview: Preview
    private var menu: UIMenu

    init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder preview: @escaping () -> Preview, @ViewBuilder actions: @escaping () -> UIMenu) {
        self.content = content()
        self.preview = preview()
        self.menu = actions()
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CCMContentView()
}
