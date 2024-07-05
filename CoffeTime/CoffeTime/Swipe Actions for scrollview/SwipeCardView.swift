//
//  SwipeCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.07.2024.
//

import SwiftUI

struct SwipeCardView: View {

    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 80, height: 5)

                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 60, height: 5)
            }

            Spacer(minLength: 0)
        }
        .foregroundStyle(.white.opacity(0.4))
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(color.gradient)
    }
}

#Preview {
    SwipeCardView(color: .purple)
}
