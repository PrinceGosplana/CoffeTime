//
//  SCSHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 24.09.2024.
//

import SwiftUI

struct SCSHomeView: View {

    @State private var currentIndex: Int = 0
    @State private var posts = SCSPost.mock

    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 12) {
                Button {

                } label: {
                    Label {
                        Text("Back")
                            .fontWeight(.semibold)
                    } icon: {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                    }
                    .foregroundStyle(.primary)
                }

                Text("My Wishes")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            /// Snap carousel
            SCSSnapCarouselView(items: posts, index: $currentIndex) { post in
                GeometryReader { proxy in
                    let size = proxy.size

                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding(.vertical, 40)

            /// Indicator
            HStack(spacing: 10) {
                ForEach(posts.indices, id:\.self) { index in
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index )
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        
    }
}

#Preview {
    SCSContentView()
}
