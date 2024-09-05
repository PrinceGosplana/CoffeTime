//
//  CCMContextMenuHelper.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.09.2024.
//

import SwiftUI

struct CCMContextMenuHelper<Content: View, Preview: View>: UIViewRepresentable {

    private var content: Content
    private var preview: Preview

    init(content: Content, preview: Preview) {
        self.content = content
        self.preview = preview
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
