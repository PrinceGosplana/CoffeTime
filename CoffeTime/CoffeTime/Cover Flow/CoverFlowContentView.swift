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

    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 0)

                CoverFlowView(
                    itemWidth: 280,
                    spacing: 0,
                    rotation: 0,
                    items: items
                ) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                }
                .frame(height: 180)

                Spacer(minLength: 0)
            }
            .navigationTitle("CoverFlow")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CoverFlowContentView()
}
