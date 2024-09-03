//
//  CTBAHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

struct CTBAHomeView: View {

    var proxy: GeometryProxy
    @StateObject var bottomBarModel = CTBABottomBarViewModel()
    @Environment(\.colorScheme) var colorScheme

    /// Keyboard focus state
    @FocusState var showKeyboard: Bool

    var backgroundColor: Color {
        colorScheme == .dark ? Color.black : Color.white
    }

    var body: some View {
        ZStack {

            let bottomEdge = proxy.safeAreaInsets.bottom

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(1...7, id: \.self) { index in
                        Image("listing-\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width - 30, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                }
                .padding()
                .padding(.bottom, 60)
                .modifier(CTBAOffsetModifier())
                .environmentObject(bottomBarModel)
            }
            /// to start from 0 just set Coordinate space for scrollview
            .coordinateSpace(name: "TabScroll")

            /// SearchView
            VStack {

            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(backgroundColor)
            .opacity(showKeyboard ? 1 : 0)

            CTBABottomBar(showKeyboard: _showKeyboard)
                .environmentObject(bottomBarModel)
            /// moving down
                .offset(y: bottomBarModel.tabState == .floating ? 0 : bottomEdge)
        }
    }
}

#Preview {
    CTBAContentView()
}
