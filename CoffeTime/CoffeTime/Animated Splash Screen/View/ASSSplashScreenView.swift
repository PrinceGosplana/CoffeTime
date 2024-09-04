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

    let imageSize: CGSize

    init(imageSize: CGSize, @ViewBuilder content: @escaping () -> Content, @ViewBuilder titleView: @escaping () -> Title, logoView: @escaping () -> Logo) {
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.imageSize = imageSize
    }

    @State private var textAnimation = false
    @State private var imageAnimation = false
    @State private var endAnimation = false

    @Namespace var animation

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color("Moon")
                    .background(Color.moon)
                    .ignoresSafeArea()

                titleView
                    .offset(y: textAnimation ? 0 : 110)

                if !endAnimation {
                    logoView
                        .frame(width: imageSize.width, height: imageSize.height)
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                }

                HStack {
                    Spacer()

                    if endAnimation {
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring()) {
                    textAnimation.toggle()
                }

                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                    endAnimation.toggle()
                }
            }
        }
    }
}

#Preview {
    ASSContentView()
}
