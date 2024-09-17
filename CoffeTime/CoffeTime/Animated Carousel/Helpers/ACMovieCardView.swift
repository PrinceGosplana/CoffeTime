//
//  ACMovieCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ACMovieCardView: View {

    let movie: ACMovie
    let topOffset: CGFloat

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            /// Scaling and opacity effect
            let minY = proxy.frame(in: .global).minY - topOffset
            let progress = -minY / size.height
            let scale = 1 - (progress / 3)
            let opacity = 1 - progress

            ZStack {
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height - 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding(.horizontal, 15)
            .scaleEffect(minY < 0 ? scale : 1)
            .opacity(minY < 0 ? opacity : 1)
            /// stopping view when y value goes < 0
            .offset(y: minY < 0 ? -minY : 0)
        }
    }
}

#Preview {
    ACMovieCardView(movie: ACMovie.mock[0], topOffset: 70)
}
