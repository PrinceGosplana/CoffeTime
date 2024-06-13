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

                /// Parallax Image
                ParallaxImageView(userFullWidth: true) { size in
                    Image(.listing1)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)

                }
                .frame(height: 300)
                
                DummySection(title: "Business")

                DummySection(title: "Promotion", isLong: true)

                ParallaxImageView(maximumMovement: 150, userFullWidth: true) { size in
                    Image(.listing2)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)

                }
                .frame(height: 400)

                DummySection(title: "YouTube")

                DummySection(title: "Twitter (X)", isLong: true)
            }
            .padding(15)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ParallaxScrollEffectContent()
}
