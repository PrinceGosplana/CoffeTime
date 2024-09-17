//
//  ForYou.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ForYou: View {

    let topEdge: CGFloat
    let titleViewHeight: CGFloat = 70
    let spacingHeight: CGFloat = 15

    var body: some View {
        VStack (spacing: 15) {
            HStack {
                Text("Today For You")
                    .font(.title.bold())

                Spacer(minLength: 10)

                Button {

                } label: {
                    Image(systemName: "person.circle")
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .overlay(
                            Circle()
                                .fill(.red)
                                .frame(width: 13, height: 13)
                                .offset(x: -1, y: -1)
                            , alignment: .topTrailing
                        )
                }
            }
            .padding()

            GeometryReader { proxy in

                let size = proxy.size

                ACVerticalCarouselList {
                    VStack(spacing: 0) {
                        ForEach(ACMovie.mock) {
                            ACMovieCardView(movie: $0, topOffset: titleViewHeight + spacingHeight + topEdge)
                                .frame(height: size.height)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ACContentView()
}
