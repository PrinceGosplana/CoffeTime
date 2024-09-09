//
//  SGHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.09.2024.
//

import SwiftUI

struct SGHomeView: View {
    
    @State private var posts: [SGPostModel] = []
    /// to show dynamic
    @State var columns: Int = 2
    /// smooth hero animation effect
    @Namespace var animation

    var body: some View {
        NavigationStack {
            SGStaggeredGrid(columns: columns, list: posts, content: { post in
                SGPostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
            })
            .padding(.horizontal)
            .navigationTitle("Staggered Grid")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        columns += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        columns = max(columns - 1, 1)
                    } label: {
                        Image(systemName: "minus")
                    }
                }
            }
            .animation(.easeInOut, value: columns)
        }
        .onAppear {
            posts = SGPostModel.mocks
        }
    }
}

#Preview {
    SGContentView()
}
