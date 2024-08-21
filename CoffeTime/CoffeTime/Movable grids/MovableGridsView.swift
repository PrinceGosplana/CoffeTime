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
                        GeometryReader { _ in

                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(color.gradient)
                            /// we can pass any item that conforms to the transferable protocol, such as a string, Data, etc., in the draggable modifier
                            /// Drag
                                .draggable(color) {
                                    /// Custom preview view
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 1, height: 1)
                                        .onAppear { draggingItem = color }
                                }
                            /// Drop
                                .dropDestination(for: Color.self) { items, location in
                                    draggingItem = nil
                                    return false
                                } isTargeted: { status in
                                    /// When the source moves around the target view, the isTargetted callback is called, which allows us to find where the source is actually targeting, and thus, with the help of this, we can move items on the grid
                                    if let draggingItem, status, draggingItem != color {
                                        /// Moving Color from source to destination
                                        if let sourceIndex = colors.firstIndex(of: draggingItem), let destinationIndex = colors.firstIndex(of: color) {
                                            withAnimation(.bouncy) {
                                                let sourceItem = colors.remove(at: sourceIndex)
                                                colors.insert(sourceItem, at: destinationIndex)
                                            }
                                        }
                                    }
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
