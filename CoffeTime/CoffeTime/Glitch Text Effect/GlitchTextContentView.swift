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
            GlitchText(text: "We believe !", trigger: trigger)
                .font(.system(size: 60, weight: .semibold))
        }
        .padding()
    }
}

#Preview {
    GlitchTextContentView()
}
