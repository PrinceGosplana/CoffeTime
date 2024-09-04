//
//  ASSTabButton.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.09.2024.
//

import SwiftUI

struct ASSTabButton: View {

    let title: String
    let animation: Namespace.ID
    @Binding var currentTab: String

    var body: some View {
        Button {
            withAnimation(.spring()) {
                currentTab = title
            }
        } label: {
            VStack {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)

                /// Slider
                ZStack {
                    if currentTab == title {
                        Capsule()
                            .fill(.white)
                            .shadow(radius: 15)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame(height: 3.5)
                    } else {
                        Capsule()
                            .fill(.clear)
                            .frame(height: 3.5)
                    }
                }
            }
        }
    }
}
