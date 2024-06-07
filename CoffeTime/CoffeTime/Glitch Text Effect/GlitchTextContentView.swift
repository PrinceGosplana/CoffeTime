//
//  GlitchTextContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GlitchTextContentView: View {
    @State private var trigger: (Bool, Bool, Bool) = (false, false, false)

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                GlitchTextAnimation(text: "We believe in!", trigger: $trigger.0)
                    .font(.system(size: 60, weight: .semibold))

                GlitchTextAnimation(text: "Glitch Text Effect", trigger: $trigger.1)
                    .font(.system(size: 40, design: .rounded))

                GlitchTextAnimation(text: "and Coffee", trigger: $trigger.2)
                    .font(.system(size: 20))
            }

            Button {
                Task {
                    trigger.0.toggle()
                    try? await Task.sleep(for: .seconds(0.3))
                    trigger.1.toggle()
                    try? await Task.sleep(for: .seconds(0.4))
                    trigger.2.toggle()
                }
            } label: {
                Text("Trigger")
                    .padding(.horizontal, 15)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.black)
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    GlitchTextContentView()
}
