//
//  SwipeHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.07.2024.
//

import SwiftUI

struct SwipeHomeView: View {

    @State private var colors: [Color] = [.black, .yellow, .purple, .brown]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(colors, id:\.self) { color in
                    SwipeAction(cornerRadius: 15, direction: color == .black ? .trailing : .leading) {
                        SwipeCardView(color: color)
                    } actions: {
                        Action(tint: .blue, icon: "star.fill", isEnabled: color == .black) {
                            print("Bookmarked")
                        }

                        Action(tint: .red, icon: "trash.fill") {
                            withAnimation(.easeInOut) {
                                colors.removeAll(where: { $0 == color })
                            }
                        }
                    }

                }
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SwipeContentView()
}
