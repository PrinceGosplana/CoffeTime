//
//  ACVerticalCarouselList.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ACVerticalCarouselList<Content: View>: UIViewRepresentable {
    
    var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        setUp(scrollView: scrollView)
        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {

    }

    func setUp(scrollView: UIScrollView) {
        let hostView = UIHostingController(rootView: content)
        hostView.view.backgroundColor = .clear
        hostView.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            hostView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]

        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
    }
}
