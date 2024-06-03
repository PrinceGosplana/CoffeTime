//
//  FlipClockTextEffect.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.06.2024.
//

import SwiftUI

struct FlipClockTextEffect: View {
    @Binding var value: Int
    /// Config
    var size: CGSize
    var fontSize: CGFloat
    var cornerRadius: CGFloat
    var foreground: Color
    var background: Color
    var animationDuration: CGFloat = 0.8

    /// View Properties
    @State private var nextValue: Int = 0
    @State private var currentValue: Int = 0
    @State private var rotation: CGFloat = 0

    var body: some View {
        let halfHeight = size.height * 0.5

        ZStack {

            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .fill(background.shadow(.inner(radius: 1)))
            .frame(height: halfHeight)
            .overlay(alignment: .top) {
                TextView(nextValue)
                    .frame(
                        width: size.width,
                        height: size.height
                    )
                    .drawingGroup()
            }
            .clipped()
            .frame(maxHeight: .infinity, alignment: .top)


            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .fill(background.shadow(.inner(radius: 1)))
            .frame(height: halfHeight)
            .modifier(
                RotationModifier(
                    rotation: rotation,
                    fontSize: fontSize,
                    currentValue: currentValue,
                    nextValue: nextValue,
                    foreground: foreground,
                    size: size
                )
            )
            .clipped()
            .rotation3DEffect(
                .init(degrees: rotation),
                axis: (
                    x: 1.0,
                    y: 0.0,
                    z: 0.0
                ),
                anchor: .bottom,
                anchorZ: 0,
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
            .fill(background.shadow(.inner(radius: 1)))
            .frame(height: halfHeight)
            .overlay(alignment: .bottom) {
                TextView(currentValue)
                    .frame(
                        width: size.width,
                        height: size.height
                    )
                    .drawingGroup()
            }
            .clipped()
            .frame(maxHeight: .infinity, alignment: .bottom)

        }
        .frame(width: size.width, height: size.height)
        .onChange(of: value, initial: true) { oldValue, newValue in
            currentValue = oldValue
            nextValue = newValue

            guard rotation == 0 else {
                currentValue = newValue
                return
            }

            guard oldValue != newValue else { return }

            withAnimation(.easeInOut(duration: animationDuration), completionCriteria: .logicallyComplete) {
                rotation = -180
            } completion: {
                rotation = 0
                currentValue = value
            }
        }
    }

    /// Reusable View
    @ViewBuilder
    func TextView(_ value: Int) -> some View {
        Text("\(value)")
            .font(.system(size: fontSize).bold())
            .foregroundStyle(foreground)
            .lineLimit(1)
    }
}

#Preview {
    FlipClockTextView()
}
