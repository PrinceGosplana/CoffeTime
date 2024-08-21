//
//  MovableGridsView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 21.08.2024.
//

import SwiftUI

struct MovableGridsView: View {

    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing: 10), count: 3)

                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(colors, id:\.self) {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill($0.gradient)
                            .frame(height: 100)
                    }
                }
                .padding(15)
            }
            .navigationTitle("Movable Grids")
        }
    }
}

#Preview {
    MovableGridsView()
}
