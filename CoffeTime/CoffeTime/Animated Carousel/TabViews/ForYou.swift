//
//  ForYou.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ForYou: View {
    var body: some View {
        VStack {
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
                ACVerticalCarouselList {
                    ForEach(ACMovie.mock) { movie in

                    }
                }
            }
        }
    }
}

#Preview {
    ACContentView()
}
