//
//  PHome.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.06.2024.
//

import SwiftUI

struct PHome: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                DummySection(title: "Social Media")

                DummySection(title: "Sales", isLong: true)


            }
            .padding(15)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ParallaxScrollEffectContent()
}
