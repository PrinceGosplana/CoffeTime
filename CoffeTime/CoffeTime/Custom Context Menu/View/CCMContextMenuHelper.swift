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
    }
}
