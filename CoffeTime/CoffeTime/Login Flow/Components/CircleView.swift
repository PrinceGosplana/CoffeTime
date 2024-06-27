//
//  CircleView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.06.2024.
//

import SwiftUI

struct CircleView: View {

    var showSignup: Bool

    var body: some View {
        Circle()
            .fill(
                .linearGradient(
                    colors: [.appYellow ?? .yellow, .orange, .red],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    CircleView(showSignup: false)
}
