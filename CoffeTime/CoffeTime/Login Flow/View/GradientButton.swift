//
//  GradientButton.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.06.2024.
//

import SwiftUI

struct GradientButton: View {

    var title: String
    var icon: String
    var onClick: () -> ()

    var body: some View {
        Button {
            onClick()
        } label: {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(
                .linearGradient(
                    colors: [.appLightBrown ?? .yellow, .orange, .appBrown ?? .brown],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                in: .capsule
            )
        }
    }
}

#Preview {
    LoginContentView()
}
