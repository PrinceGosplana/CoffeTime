//
//  SideBarMenuView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 12.06.2024.
//

import SwiftUI

struct SideBarMenuView: View {
    
    let safeArea: UIEdgeInsets

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Side Menu")
                .font(.largeTitle.bold())
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .padding(.top, safeArea.top)
        .padding(.bottom, safeArea.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .environment(\.colorScheme, .dark)
    }
}

