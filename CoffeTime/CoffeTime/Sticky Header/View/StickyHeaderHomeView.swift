//
//  StickyHeaderHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.07.2024.
//

import SwiftUI

struct StickyHeaderHomeView: View {
    var body: some View {
        GeometryReader { proxy in
            let safeAreaTop = proxy.safeAreaInsets.top

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    StickyHeaderView(safeAreaTop: safeAreaTop)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    StickyHeaderContentView()
}
