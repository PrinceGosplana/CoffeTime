//
//  ASSSplashScreenView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.09.2024.
//

import SwiftUI

struct ASSSplashScreenView<Content: View, Title: View, Logo: View, NavButton: View>: View {
    
    let content: Content
    let titleView: Title
    let logoView: Logo
    let navButton: NavButton
    
    let imageSize: CGSize
    
    init(
        imageSize: CGSize,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder titleView: @escaping () -> Title,
        logoView: @escaping () -> Logo,
        @ViewBuilder navButton: @escaping () -> NavButton
    ) {
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.navButton = navButton()
        self.imageSize = imageSize
    }
    
    @State private var textAnimation = false
    @State private var imageAnimation = false
    @State private var endAnimation = false
    @State private var showNavButton = false
    
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color("Moon")
                    .background(Color.moon)
                    .ignoresSafeArea()
                
                titleView
                    .scaleEffect(endAnimation ? 0.75 : 1)
                    .offset(y: textAnimation ? -5 : 110)
                
                if !endAnimation {
                    logoView
                        .frame(width: imageSize.width, height: imageSize.height)
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                }
                
                HStack {
                    
                    navButton
                        .opacity(showNavButton ? 1 : 0)
                    Spacer()
                    
                    if endAnimation {
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: 30, height: 30)
                            .offset(y: -5)
                    }
                }
                .padding(.horizontal)
            }
            /// decreasing size when animation ended
            .frame(height: endAnimation ? 60 : nil)
            .zIndex(1)
            
            /// Home view
            content
                .frame(height: endAnimation ? nil : 0)
            /// moving back
                .zIndex(0)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring()) {
                    textAnimation.toggle()
                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                    endAnimation.toggle()
                }
                
                /// showing after some delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    withAnimation {
                        showNavButton.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ASSContentView()
}
