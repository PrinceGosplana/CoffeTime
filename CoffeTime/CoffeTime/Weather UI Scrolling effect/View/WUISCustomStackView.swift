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
                .background(.ultraThinMaterial, in: WUISCustomCorner(corners: bottomOffset < 38 ? .allCorners : [.topLeft, .topRight], radius: 12))
                .zIndex(1)
            VStack {
                Divider()

                contentView
                    .padding()
            }
            .background(.ultraThinMaterial, in: WUISCustomCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
            /// Moving content upward
            .offset(y: topOffset >= 120 ? 0 : -(-topOffset + 120))
            .zIndex(0)
            /// Clipping to avoid background overlay
            .clipped()
        }
        .preferredColorScheme(.dark)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .opacity(getOpacity())
        /// Stopping view $120
        .offset(y: topOffset >= 120 ? 0 : -topOffset + 120)
        .background {
            GeometryReader { proxy -> Color in
                
                let minY = proxy.frame(in: .global).minY
                let maxY = proxy.frame(in: .global).maxY

                Task { @MainActor in
                    self.topOffset = minY
                    self.bottomOffset = maxY - 120
                }
                return Color.clear
            }
        }
        .modifier(CornerModifier(bottomOffset: $bottomOffset))
    }

    private func getOpacity() -> CGFloat {
        if bottomOffset < 28 {
            return bottomOffset / 28
        }
        return 1
    }
}


// to avoid this creating new modifier
struct CornerModifier: ViewModifier {
    @Binding var bottomOffset: CGFloat

    func body(content: Content) -> some View {
        if bottomOffset < 38 {
            content
        } else {
            content
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}
