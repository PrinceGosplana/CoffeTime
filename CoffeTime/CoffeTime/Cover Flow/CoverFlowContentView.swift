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
    var body: some View {
        NavigationStack {
            VStack {
                CoverFlowView(itemWidth: 280, items: items) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                }
                .frame(height: 180)
            }
            .navigationTitle("CoverFlow")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CoverFlowContentView()
}
