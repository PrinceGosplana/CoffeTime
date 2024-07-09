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
    }
}

#Preview {
    UHEContentView()
}
