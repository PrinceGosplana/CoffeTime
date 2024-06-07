//
//  GlitchTextContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GlitchTextContentView: View {
    @State private var trigger: Bool = false

    var body: some View {
        VStack {
            GlitchText(text: "We believe !", trigger: trigger) {
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
                .font(.system(size: 60, weight: .semibold))

            Button {
                trigger.toggle()
            } label: {
                Text("Trigger")
                    .padding(.horizontal, 15)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.black)
        }
        .padding()
    }
}

#Preview {
    GlitchTextContentView()
}
