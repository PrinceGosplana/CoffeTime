//
//  APIHome.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.08.2024.
//

import SwiftUI

struct APIHome: View {

    @State private var colors: [Color] = [.red, .blue, .green, .yellow]
    @State private var opacityEffect: Bool = false
    @State private var clipEdges: Bool = false

    var body: some View {
        VStack {
            /// Paging view
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(colors, id:\.self) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill($0.gradient)
                            .padding(.horizontal, 15)
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .overlay(alignment: .bottom) {
                    PagingIndicator(
                        activeTint: .white,
                        inActiveTint: .black.opacity(0.25),
                        opacityEffect: opacityEffect,
                        clipEdges: clipEdges
                    )
                }
            }
            .scrollTargetBehavior(.paging)
            .frame(height: 220)

            List {
                Section {
                    Toggle("Opacity Effect", isOn: $opacityEffect)
                    Toggle("Clip Edges", isOn: $clipEdges)

                    Button("Add Item") {
                        colors.append(.random)
                    }
                } header: {
                    Text("Options")
                }

            }
            .clipShape(.rect(cornerRadius: 15))
            .padding(15)
        }
        .navigationTitle("Custom Indicator")
    }
}

#Preview {
    APIContentView()
}
