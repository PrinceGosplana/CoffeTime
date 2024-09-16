//
//  ACMovieCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ACMovieCardView: View {

    let movie: ACMovie

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack {
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height - 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    ACMovieCardView(movie: ACMovie.mock[0])
}
