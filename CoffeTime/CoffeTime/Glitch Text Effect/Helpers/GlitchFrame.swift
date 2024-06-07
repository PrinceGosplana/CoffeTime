//
//  GlitchFrame.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GlitchFrame: Animatable {

    /// KeyFrame values must conform to the Animatable protocol, and if we want to use several values in the Animatable protocol, we can use AnimatablePair
    var animatableData: AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>> {
        get {
            return .init(top, .init(center, .init(bottom, shadowOpacity)))
        }
        set {
            top = newValue.first
            center = newValue.second.first
            bottom = newValue.second.second.first
            shadowOpacity = newValue.second.second.second
        }
    }

    /// X-offset's
    var top: CGFloat = 0
    var center: CGFloat = 0
    var bottom: CGFloat = 0
    var shadowOpacity: CGFloat = 0
}
