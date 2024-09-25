//
//  GMGlassMorphicCard.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 25.09.2024.
//

import SwiftUI

struct GMGlassMorphicCard: View {
    var body: some View {

        let width = UIScreen.main.bounds.width

        ZStack {

            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.1)
                .background(
                    Color.white
                        .opacity(0.08)
                        .blur(radius: 10)
                )
            /// Strokes
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(
                            .linearGradient(
                                colors: [
                                    .brown,
                                    .brown.opacity(0.5),
                                    .clear,
                                    .clear,
                                    Color.appLightBrown ?? .brown
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ), lineWidth: 2.5
                        )
                        .padding(2)
                )
                .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)

            VStack {
                Image(systemName: "sun.max")
                    .font(.system(size: 75, weight: .thin))

                Text("18")
                    .font(.system(size: 85, weight: .bold))
                    .padding(.top, 2)
                    .overlay(
                        Text("ºC")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.7))
                            .offset(x: 30, y: 15)
                        , alignment: .topTrailing
                    )
                    .offset(x: -6)

                Text("Cracow, Poland")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.4))
            }
        }
        .frame(width: width / 1.7, height: 270)
    }
}

#Preview {
    GMContentView()
}
