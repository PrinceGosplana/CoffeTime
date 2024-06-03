//
//  FlipClockTextEffect.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.06.2024.
//

import SwiftUI

struct FlipClockTextEffect: View {
    var value: Int
    /// Config
    var size: CGSize
    var fontSize: CGFloat
    var cornerRadius: CGFloat
    var foreground: Color
    var background: Color

    /// View Properties
    @State private var nextValue: Int = 1
    @State private var currentValue: Int = 0

    var body: some View {
        let halfHeight = size.height * 0.5

        ZStack {

            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .fill(background.gradient.shadow(.inner(radius: 1)))
            .frame(height: halfHeight)
            .overlay(alignment: .top) {
                TextView(nextValue)
                    .frame(
                        width: size.width,
                        height: size.height
                    )
            }
            .clipped()
            .frame(maxHeight: .infinity, alignment: .top)


            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .fill(background.gradient.shadow(.inner(radius: 1)))
            .frame(height: halfHeight)
            .modifier(
                RotationModifier(
                    rotation: 0,
                    fontSize: fontSize,
                    currentValue: currentValue,
                    nextValue: nextValue,
                    foreground: foreground,
                    size: size
                )
            )
            .clipped()
            .rotation3DEffect(
                .init(degrees: 0),
                axis: (
                    x: 1.0,
                    y: 0.0,
                    z: 0.0
                ),
                anchor: .bottom,
                perspective: 0.4
            )
            .frame(maxHeight: .infinity, alignment: .top)
            .zIndex(10)

            UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: cornerRadius,
                bottomTrailingRadius: cornerRadius,
                topTrailingRadius: 0
            )
            .fill(background.gradient.shadow(.inner(radius: 1)))
            .frame(height: halfHeight)
            .overlay(alignment: .bottom) {
                TextView(currentValue)
                    .frame(
                        width: size.width,
                        height: size.height
                    )
            }
            .clipped()
            .frame(maxHeight: .infinity, alignment: .bottom)

        }
        .frame(width: size.width, height: size.height)
    }

    /// Reusable View
    @ViewBuilder
    func TextView(_ value: Int) -> some View {
        Text("\(value)")
            .font(.system(size: fontSize).bold())
            .foregroundStyle(foreground)
    }
}

#Preview {
    FlipClockTextView()
}
