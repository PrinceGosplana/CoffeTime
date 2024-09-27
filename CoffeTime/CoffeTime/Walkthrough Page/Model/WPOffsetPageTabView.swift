//
//  WPOffsetPageTabView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.09.2024.
//

import SwiftUI

struct WPOffsetPageTabView<Content: View>: UIViewRepresentable {

    var content: Content
    @Binding var offset: CGFloat

    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        _offset = offset
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ]

        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)

        /// enabling paging
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false

        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {

    }

}

#Preview {
    WPContentView()
}
