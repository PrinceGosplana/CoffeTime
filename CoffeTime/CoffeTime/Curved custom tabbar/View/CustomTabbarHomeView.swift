//
//  CustomTabbarHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.07.2024.
//

import SwiftUI

struct CustomTabbarHomeView: View {

    @State private var activeTab: CTab = .home
/// for smooth shape sliding effect, we're going to use matched geometry effect
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero

    init() {
        /// Hiding tab bar due to SwiftUI iOS 16 bug
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text(CTab.home.rawValue)
                    .tag(CTab.home)
                /// hiding native tab bar
//                    .toolbar(.hidden, for: .tabBar)

                Text(CTab.services.rawValue)
                    .tag(CTab.services)

                Text(CTab.partners.rawValue)
                    .tag(CTab.partners)

                Text(CTab.activity.rawValue)
                    .tag(CTab.activity)
            }

            CustomTabBar(
                activeTab: $activeTab,
                animation: animation,
                tabShapePosition: $tabShapePosition
            )
        }
    }
}

#Preview {
    CustomTabbarContentView()
}
