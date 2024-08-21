//
//  MovableGridsView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 21.08.2024.
//

import SwiftUI

struct MovableGridsView: View {

    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]
    @State private var draggingItem: Color?

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing: 10), count: 3)

                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(colors, id:\.self) { color in
                        GeometryReader {
                            let size = $0.size

                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(color.gradient)
                            /// we can pass any item that conforms to the transferable protocol, such as a string, Data, etc., in the draggable modifier
                                .draggable(color) {
                                    /// Custom preview view
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: size.width, height: size.height)
                                }
                        }
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
