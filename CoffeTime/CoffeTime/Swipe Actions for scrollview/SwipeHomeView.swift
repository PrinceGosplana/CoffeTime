//
//  SwipeHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.07.2024.
//

import SwiftUI

struct SwipeHomeView: View {

    @State private var colors: [Color] = [.black, .yellow, .purple, .brown]
    @ActionBuilder var actions: [Action]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(colors, id:\.self) { color in
                    SwipeCardView(color: color)
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
