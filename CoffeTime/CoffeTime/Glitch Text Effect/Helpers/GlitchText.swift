//
//  GlitchText.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GlitchText: View {
    let text: String
    let trigger: Bool
    let shadow: Color
    let radius: CGFloat
    let frames: [LinearKeyframe<GlitchFrame>]

    init(
        text: String,
        trigger: Bool,
        shadow: Color = .red,
        radius: CGFloat = 1,
        @GlitchFrameBuilder frames: @escaping () -> [LinearKeyframe<GlitchFrame>]
    ) {
        self.text = text
        self.trigger = trigger
        self.shadow = shadow
        self.radius = radius
        self.frames = frames()
    }

    var body: some View {
        KeyframeAnimator(initialValue: GlitchFrame(), trigger: trigger) { value in
            ZStack {
                GTTextView(text: text, alignment: .top, offset: value.top, opacity: value.shadowOpacity, shadow: shadow, radius: radius)
                GTTextView(text: text, alignment: .center, offset: value.center, opacity: value.shadowOpacity, shadow: shadow, radius: radius)
                GTTextView(text: text, alignment: .bottom, offset: value.bottom, opacity: value.shadowOpacity, shadow: shadow, radius: radius)
            }
        } keyframes: { _ in
            for frame in frames {
                frame
            }
        }

    }
}

#Preview {
    GlitchTextContentView()
}
