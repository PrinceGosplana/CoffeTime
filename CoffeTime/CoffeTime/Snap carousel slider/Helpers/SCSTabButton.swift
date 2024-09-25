//
//  SCSTabButton.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 25.09.2024.
//

import SwiftUI

struct SCSTabButton: View {

    let animation: Namespace.ID
    let title: String
    @Binding var currentTab: String

    var body: some View {
        Button {
            withAnimation(.spring()) {
                currentTab = title
            }
        } label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(currentTab == title ? .white : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(
                    ZStack {
                        if currentTab == title {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                )
        }
    }
}
