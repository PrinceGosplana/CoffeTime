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

        }
    }
}

#Preview {
    ThemeChangeView()
}
