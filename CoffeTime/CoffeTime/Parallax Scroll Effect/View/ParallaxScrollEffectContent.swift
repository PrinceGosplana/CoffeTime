//
//  ParallaxScrollEffectContent.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.06.2024.
//

import SwiftUI

struct ParallaxScrollEffectContent: View {
    var body: some View {
        NavigationStack {
            PHome()
                .navigationTitle("Parallax Scroll")
        }
    }
}

#Preview {
    ParallaxScrollEffectContent()
}
