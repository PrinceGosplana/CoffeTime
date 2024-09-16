//
//  ACCustomTabBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ACCustomTabBar: View {
    
    @Binding var currentTab: String

    var body: some View {
        HStack(spacing: 0) {
            ACTabBarButton(title: "For You", image: "rectangle.portrait", currentTab: $currentTab)
            ACTabBarButton(title: "Search", image: "magnifyingglass", currentTab: $currentTab)
            ACTabBarButton(title: "Following", image: "bookmark", currentTab: $currentTab)
            ACTabBarButton(title: "Downloads", image: "square.and.arrow.down", currentTab: $currentTab)
        }
        .frame(height: 60)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    ACContentView()
}
