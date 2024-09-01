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

    /// Offsets
    @State private var topOffset: CGFloat = 0
    @State private var bottomOffset: CGFloat = 0

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
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        /// Stopping view $120
        .offset(y: topOffset >= 120 ? 0 : -topOffset + 120)
        .background {
            GeometryReader { proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                DispatchQueue.main.async {
                    self.topOffset = minY
                }
                return Color.clear
            }
        }
    }
}
