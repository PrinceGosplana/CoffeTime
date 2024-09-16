//
//  ACTabBarButton.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ACTabBarButton: View {

    let title: String
    let image: String
    @Binding var currentTab: String

    var body: some View {
        Button {
            withAnimation {
                currentTab = title
            }
        } label: {
            VStack(spacing: 5) {
                Image(systemName: image)
                    .font(.title2)

                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(title == currentTab ? .primary : Color.gray)
            .frame(maxWidth: .infinity)
        }
    }
}

