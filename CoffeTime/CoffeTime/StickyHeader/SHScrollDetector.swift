//
//  SHScrollDetector.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import SwiftUI

/// Extracting UIScroll from SwiftUI ScrollView for monitoring offset and velocity
struct ScrollDetector: UIViewRepresentable {
    var onScroll: (CGFloat) -> ()

    // Offset, Velocity
    var onDraggingEnd: (CGFloat, CGFloat) -> ()

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> some UIView {
        UIView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        Task { @MainActor in
            if let scrollView = uiView.superview?.superview?.superview as? UIScrollView {
                scrollView.delegate = context.coordinator
                context.coordinator.isDelegateAdded = true
            }
        }
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: ScrollDetector

        init(parent: ScrollDetector) {
            self.parent = parent
        }

        //One time delegate Initialisation
        var isDelegateAdded: Bool = false

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.onScroll(scrollView.contentOffset.y)
        }

        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            parent.onDraggingEnd(targetContentOffset.pointee.y, velocity.y)
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView.panGestureRecognizer.view)
            parent.onDraggingEnd(scrollView.contentOffset.y, velocity.y)
        }
    }
}
