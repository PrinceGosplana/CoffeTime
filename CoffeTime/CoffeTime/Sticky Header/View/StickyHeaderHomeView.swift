//
//  StickyHeaderHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.07.2024.
//

import SwiftUI

struct StickyHeaderHomeView: View {

    // MARK: Header animation properties
    @State var offsetY: CGFloat = 0
    @State var showSearchBar: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            let safeAreaTop = proxy.safeAreaInsets.top

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    StickyHeaderView(safeAreaTop: safeAreaTop, offsetY: offsetY, showSearchBar: $showSearchBar)
                        .offset(y: -offsetY)
                        .zIndex(1)

                    /// Scroll content goes here
                    VStack {
                        ForEach(1...10, id:\.self) { _ in
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.indigo.gradient)
                                .frame(height: 220)
                        }
                    }
                    .padding(15)
                    .zIndex(0)
                }
                .offset(coordinateSpace: .named("SCROLL")) { offset in
                    offsetY = offset
                    showSearchBar = (-offset > 80) && showSearchBar
                }
            }
            .coordinateSpace(name: "SCROLL")
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    StickyHeaderContentView()
}
