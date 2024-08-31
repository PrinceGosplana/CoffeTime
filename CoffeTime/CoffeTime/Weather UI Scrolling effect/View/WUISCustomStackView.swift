//
//  WUISCustomStackView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 31.08.2024.
//

import SwiftUI

struct WUISCustomStackView<Title: View, Content: View>: View {

    var titleView: Title
    var contentView: Content

    init(@ViewBuilder titleView: @escaping () -> Title, @ViewBuilder contentView: @escaping () -> Content) {
        self.contentView = contentView()
        self.titleView = titleView()
    }

    var body: some View {
        VStack(spacing: 0) {
            titleView
                .font(.callout)
                .lineLimit(2)
                .frame(height: 38)
                .background(.ultraThinMaterial, in: WUISCustomerCorner(corners: [.topLeft, .topRight], radius: 12))
        }
    }
}
