//
//  ACHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 15.09.2024.
//

import SwiftUI

struct ACHomeView: View {

    @State private var currentTab = "For you"

    /// Hiding tabbar
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        TabView(selection: $currentTab) {
            GeometryReader { proxy in
                let topEdge = proxy.safeAreaInsets.top

                ForYou(topEdge: topEdge)
                    .padding(.top, topEdge)
                    .ignoresSafeArea(.all, edges: .top)
            }

            Text("Search")
                .tag("Search")

            Text("Following")
                .tag("Following")

            Text("Downloads")
                .tag("Downloads")
        }
        .overlay(
            ACCustomTabBar(currentTab: $currentTab)
            , alignment: .bottom
        )
    }
}

#Preview {
    ACContentView()
}
