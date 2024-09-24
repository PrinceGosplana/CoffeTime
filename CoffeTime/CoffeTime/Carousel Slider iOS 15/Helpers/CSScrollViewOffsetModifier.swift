//
//  CSScrollViewOffsetModifier.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.09.2024.
//

import SwiftUI

struct CSScrollViewOffsetModifier: ViewModifier {

    var anchorPoint: CSAnchor = .top
    @Binding var offset: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy -> Color in
                    let frame = proxy.frame(in: .global)

                    Task { @MainActor in
                        switch anchorPoint {
                        case .top: offset = frame.minY
                        case .bottom: offset = frame.maxY
                        case .leading: offset = frame.minX
                        case .trailing: offset = frame.maxX
                        }
                    }

                    return Color.clear
                }
            }
    }
}

enum CSAnchor {
    case top
    case bottom
    case leading
    case trailing
}
