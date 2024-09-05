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
    private var actions: UIMenu

    init(content: Content, preview: Preview, actions: UIMenu) {
        self.content = content
        self.preview = preview
        self.actions = actions
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear



        /// setting our content view as main interaction view
        let hostView = UIHostingController(rootView: content)

        /// Setting constraints
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]

        view.addSubview(hostView.view)
        view.addConstraints(constraints)

        let interaction = UIContextMenuInteraction(delegate: context.coordinator)
        view.addInteraction(interaction)
        return view
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(presenter: self)
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }

    /// Context menu delegate
    class Coordinator: NSObject, UIContextMenuInteractionDelegate {
        var presenter: CCMContextMenuHelper

        init(presenter: CCMContextMenuHelper) {
            self.presenter = presenter
        }

        /// Delegate methods
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(identifier: nil) {
                let previewController = UIHostingController(rootView: self.presenter.preview)
                previewController.view.backgroundColor = .clear
                return previewController
            } actionProvider: { items in
                return self.presenter.actions
            }
        }
        /// Expand context menu
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
            animator.addCompletion {
                print("Complete")
            }
        }
    }

}
