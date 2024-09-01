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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial, in: WUISCustomCorner(corners: [.topLeft, .topRight], radius: 12))

            VStack {
                Divider()

                contentView
                    .padding()
            }
            .background(.ultraThinMaterial, in: WUISCustomCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
        }
        .preferredColorScheme(.dark)
    }
}
