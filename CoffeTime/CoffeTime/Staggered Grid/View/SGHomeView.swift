//
//  SGHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.09.2024.
//

import SwiftUI

struct SGHomeView: View {
    
    @State private var posts: [SGPostModel] = []

    var body: some View {
        NavigationStack {
            SGStaggeredGrid(list: posts, content: { post in
                SGPostCardView(post: post)
            })
            .navigationTitle("Staggered Grid")
        }
        .onAppear {
            posts = SGPostModel.mocks
        }
    }
}

#Preview {
    SGContentView()
}
