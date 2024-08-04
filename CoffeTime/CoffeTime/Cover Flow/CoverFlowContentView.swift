//
//  CoverFlowContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.08.2024.
//

import SwiftUI

struct CoverFlowContentView: View {

    @State private var items: [CoverFlowItem] = [.red, .blue, .mint, .yellow, .indigo].compactMap {  return .init(color: $0)  
    }

    /// View properties
    @State private var spacing: CGFloat = 0
    @State private var rotation: CGFloat = .zero
    @State private var enableReflection: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 0)

                CoverFlowView(
                    itemWidth: 280,
                    enableReflection: enableReflection,
                    spacing: spacing,
                    rotation: rotation,
                    items: items
                ) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                }
                .frame(height: 180)

                Spacer(minLength: 0)

                /// Customization View
                VStack(alignment: .leading, spacing: 10) {
                    Toggle("Toggle Reflection", isOn: $enableReflection)

                    Text("Card Spacing")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    Slider(value: $spacing, in: -120...20)

                    Text("Card Rotation")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    Slider(value: $rotation, in: 0...100)
                }
                .padding(15)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
                .padding(15)
            }
            .navigationTitle("CoverFlow")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CoverFlowContentView()
}
