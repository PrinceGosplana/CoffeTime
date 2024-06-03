//
//  RotationModifier.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.06.2024.
//

import SwiftUI

struct RotationModifier: ViewModifier, Animatable {
    var rotation: CGFloat
    var fontSize: CGFloat
    var currentValue: Int
    var nextValue: Int
    var foreground: Color
    var size: CGSize

    var animatableData: CGFloat {
        get { rotation }
        set { rotation = newValue }

    }

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                Group {
                    if -rotation > 90 {
                        Text("\(nextValue)")
                            .font(.system(size: fontSize).bold())
                            .foregroundStyle(foreground)
                            .scaleEffect(x: 1, y: -1)
                            .transition(.identity)
                            .lineLimit(1)
                    } else {
                        Text("\(currentValue)")
                            .font(.system(size: fontSize).bold())
                            .foregroundStyle(foreground)
                            .transition(.identity)
                            .lineLimit(1)
                    }
                }
                .frame(width: size.width, height: size.height)
                .drawingGroup()
            }
    }
}
