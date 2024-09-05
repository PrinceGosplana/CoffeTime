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
    private var onEnd: () -> ()

    init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder preview: @escaping () -> Preview,
        @ViewBuilder actions: @escaping () -> UIMenu,
        onEnd: @escaping () -> ()) {
        self.content = content()
        self.preview = preview()
        self.menu = actions()
        self.onEnd = onEnd
    }

    var body: some View {
        ZStack {
            content
                .hidden()
                .overlay {
                    CCMContextMenuHelper(content: content, preview: preview, actions: menu, onEnd: onEnd)
                }

        }
    }
}

#Preview {
    CCMContentView()
}
