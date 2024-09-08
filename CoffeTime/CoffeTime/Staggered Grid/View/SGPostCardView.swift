//
//  SGPostCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.09.2024.
//

import SwiftUI

struct SGPostCardView: View {

    let post: SGPostModel

    var body: some View {
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SGPostCardView(post: SGPostModel(imageURL: ""))
}
