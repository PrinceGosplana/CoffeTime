//
//  SideBarButton.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 12.06.2024.
//

import SwiftUI

struct SideBarButton: View {

    let tab: SideMenuTab
    var onTap: () -> ()

    init(_ tab: SideMenuTab, onTap: @escaping () -> () = {}) {
        self.tab = tab
        self.onTap = onTap
    }
    
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 12) {
                Image(systemName: tab.rawValue)
                    .font(.title3)

                Text(tab.title)
                    .font(.callout)

                Spacer(minLength: 0)
            }
            .padding(.vertical, 10)
            .contentShape(.rect)
            .foregroundStyle(Color(.secondaryLabel))
        }
    }
}
