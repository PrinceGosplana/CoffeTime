//
//  DIHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import SwiftUI

struct DIHomeView: View {

    @State private var images: [String] = ["listing-1", "listing-2", "listing-3", "listing-4", "listing-5"]
    @State private var draggingItem: String?

    var body: some View {
        ScrollView {
            let columns = Array(repeating: GridItem(spacing: 10), count: 2)

            LazyVGrid(columns: columns) {
                ForEach(images, id:\.self) { img in

                    GeometryReader {
                        let size = $0.size

                        Image(img)
                            .resizable()
                            .scaledToFill()
                            .frame(width: size.width, height: size.height)
                            .draggable(img) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.clear)
                                    .frame(maxWidth: size.width, maxHeight: size.height)
                                    .onAppear() {
                                        draggingItem = img
                                    }
                            }
                            .dropDestination(for: String.self, action: { items, location in
                                draggingItem = nil
                                return false
                            }, isTargeted: { status in
                                if let draggingItem, status, draggingItem != img {
                                    if let sourceIndex = images.firstIndex(of: draggingItem), let destinationIndex = images.firstIndex(of: img) {
                                        withAnimation(.easeInOut) {
                                            let sourceItem = images.remove(at: sourceIndex)
                                            images.insert(sourceItem, at: destinationIndex)
                                        }
                                    }
                                }
                            })
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    }
                    .frame(height: 200)
                }
                .padding()
            }
        }
        .navigationTitle("Draggable Images")
    }
}

#Preview {
    DIContentView()
}
