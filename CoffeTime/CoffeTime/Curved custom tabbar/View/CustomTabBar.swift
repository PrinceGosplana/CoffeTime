//
//  CustomTabBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.07.2024.
//

import SwiftUI

struct CustomTabBar: View {
    var tint: Color = .blue
    var inactiveTint: Color = .blue
    @Binding var activeTab: CTab
    var animation: Namespace.ID
    @Binding var tabShapePosition: CGPoint

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(CTab.allCases) {
                CTabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0, 
                    animation: animation,
                    activeTab: $activeTab, 
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            CTabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}
