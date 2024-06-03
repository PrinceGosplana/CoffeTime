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

    var animatableData: CGFloat {
        get { rotation }
        set { rotation = newValue }

    }

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if -rotation > 90 {
                    Text("\(nextValue)")
                        .font(.system(size: fontSize).bold())
                        .foregroundStyle(foreground)
                        .scaleEffect(x: 1, y: -1)
                        .transition(.identity)
                } else {
                    Text("\(currentValue)")
                        .font(.system(size: fontSize).bold())
                        .foregroundStyle(foreground)
                        .transition(.identity)
                }
            }
    }
}
