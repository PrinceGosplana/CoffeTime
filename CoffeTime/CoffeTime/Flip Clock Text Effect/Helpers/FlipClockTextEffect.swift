//
//  FlipClockTextEffect.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.06.2024.
//

import SwiftUI

struct FlipClockTextEffect: View {

    /// Config
    var size: CGSize
    var fontSize: CGFloat
    var cornerRadius: CGFloat
    var foreground: Color
    var background: Color

    var body: some View {
        ZStack {
            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .fill(background.gradient)
        }
        .frame(width: size.width, height: size.height)
    }
}

#Preview {
    ContentView()
}
