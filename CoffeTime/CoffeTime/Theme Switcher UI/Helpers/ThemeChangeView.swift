//
//  ThemeChangeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.07.2024.
//

import SwiftUI

struct ThemeChangeView: View {
    @Environment(\.colorScheme) private var scheme
    @AppStorage("user_theme") private var userTheme: TCTheme = .systemDefault
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150, height: 150)

            Text("Choose a Style")
                .font(.title2.bold())
                .padding(.top, 25)

            Text("Pop or subtle, Day or night.\nCustomize your interface.")
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ThemeChangeContentView()
}
