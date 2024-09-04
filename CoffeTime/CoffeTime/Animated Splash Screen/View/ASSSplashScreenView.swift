//
//  ASSSplashScreenView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.09.2024.
//

import SwiftUI

struct ASSSplashScreenView<Content: View, Title: View, Logo: View>: View {

    let content: Content
    let titleView: Title
    let logoView: Logo

    init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder titleView: @escaping () -> Title, logoView: @escaping () -> Logo) {
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
    }

    @State private var textAnimation = false
    @State private var imageAnimation = false
    @State private var endAnimation = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color("Moon")
                    .background(Color.moon)
                    .ignoresSafeArea()

                titleView
                    .offset(y: textAnimation ? 0 : 110)

                if !imageAnimation {
                    logoView
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring()) {
                    textAnimation.toggle()
                }

                withAnimation(.easeIn(duration: 1.5)) {
                    imageAnimation.toggle()
                }
            }
        }
    }
}

#Preview {
    ASSContentView()
}
