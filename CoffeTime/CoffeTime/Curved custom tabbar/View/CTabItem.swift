//
//  CTabItem.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.07.2024.
//

import SwiftUI

struct CTabItem: View {

    let tint: Color
    let inactiveTint: Color
    let tab: CTab
    let animation: Namespace.ID
    @Binding var activeTab: CTab
    @Binding var position: CGPoint

    /// Each tab item position on the screen
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundStyle(activeTab == tab ? .white : inactiveTint)
            /// increasing size for the active tab
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                        /// this code brings circle moving effect
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }

            Text(tab.rawValue)
                .font(.caption)
                .foregroundStyle(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX

            /// updating active tab position
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab

            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}
