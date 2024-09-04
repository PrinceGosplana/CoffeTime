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
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color("Moon")
                    .background(Color.moon)
                    .ignoresSafeArea()

                titleView
                    .offset(y: 110)
                
                logoView
            }
        }
    }
}

#Preview {
    ASSContentView()
}
