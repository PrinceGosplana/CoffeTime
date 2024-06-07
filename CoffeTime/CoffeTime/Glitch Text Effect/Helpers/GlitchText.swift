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

    var body: some View {
        KeyframeAnimator(initialValue: false, trigger: trigger) { value in
            GTTextView(text: text)
        } keyframes: { _ in
            
        }

    }
}

#Preview {
    GlitchTextContentView()
}
