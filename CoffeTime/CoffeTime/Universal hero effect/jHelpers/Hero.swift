//
//  Hero.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.07.2024.
//

import SwiftUI

/// This wrapper will create the necessary overlay window for handling hero animations, and the app entry point must be wrapped with this
struct HeroWrapper<Content: View>: View {
    @ViewBuilder var content: Content

    @Environment(\.scenePhase) private var scene
    @State private var overlayWindow: UIWindow?
    
    var body: some View {
        content
            .customOnChange(value: scene) { newValue in
                if newValue == .active { addOverlayWindow() }
            }
    }

    /// adding overlay window
    func addOverlayWindow() {
        for scene in UIApplication.shared.connectedScenes {
            /// finding active scene
            if let windowScene = scene as? UIWindowScene, scene.activationState == .foregroundActive, overlayWindow == nil {
                let window = UIWindow(windowScene: windowScene)
                window.backgroundColor = .clear
                window.isUserInteractionEnabled = false
                window.isHidden = false
                let rootController = UIHostingController(rootView: HeroLayerView())
                rootController.view.frame = windowScene.screen.bounds
                rootController.view.backgroundColor = .clear

                window.rootViewController = rootController
                self.overlayWindow = window
            }
        }

        if overlayWindow == nil {

        }
    }
}

#Preview {
    UHEContentView()
}

fileprivate struct HeroLayerView: View {
    var body: some View {
        Rectangle()
            .fill(.red)
    }
}
