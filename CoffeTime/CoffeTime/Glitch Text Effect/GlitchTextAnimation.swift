//
//  GlitchTextAnimation.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GlitchTextAnimation: View {
    let text: String
    @Binding var trigger: Bool

    var body: some View {
        ZStack {
            GlitchText(text: text, trigger: trigger) {
                LinearKeyframe(
                    GlitchFrame(
                        top: -5,
                        center: 0,
                        bottom: 0,
                        shadowOpacity: 0.2
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: -5,
                        center: -5,
                        bottom: -5,
                        shadowOpacity: 0.6
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: -5,
                        center: -5,
                        bottom: 5,
                        shadowOpacity: 0.8
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 5,
                        bottom: 5,
                        shadowOpacity: 0.4
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 0,
                        bottom: 5,
                        shadowOpacity: 0.1
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(),
                    duration: 0.1
                )
            }

            GlitchText(text: text, trigger: trigger, shadow: .green) {
                LinearKeyframe(
                    GlitchFrame(
                        top: 0,
                        center: 5,
                        bottom: 0,
                        shadowOpacity: 0.2
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 5,
                        bottom: 5,
                        shadowOpacity: 0.3
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 5,
                        bottom: -5,
                        shadowOpacity: 0.5
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: 0,
                        center: 5,
                        bottom: -5,
                        shadowOpacity: 0.6
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(
                        top: 0,
                        center: -5,
                        bottom: 0,
                        shadowOpacity: 0.3
                    ),
                    duration: 0.1
                )

                LinearKeyframe(
                    GlitchFrame(),
                    duration: 0.1
                )
            }
        }
    }
}

#Preview {
    GlitchTextAnimation(text: "Test", trigger: .constant(false))
}
