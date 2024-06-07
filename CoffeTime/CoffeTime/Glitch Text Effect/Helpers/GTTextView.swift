//
//  GTTextView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GTTextView: View {
    let text: String
    let alignment: Alignment
    let offset: CGFloat
    let opacity: CGFloat
    let shadow: Color
    let radius: CGFloat

    var body: some View {
        Text(text)
            .mask {
                switch alignment {
                case .top:
                    VStack(spacing: 0) {
                        Rectangle()
                        GTExtendedSpacer()
                        GTExtendedSpacer()
                    }
                case .center:
                    VStack(spacing: 0) {
                        GTExtendedSpacer()
                        Rectangle()
                        GTExtendedSpacer()
                    }
                default:
                    VStack(spacing: 0) {
                        GTExtendedSpacer()
                        GTExtendedSpacer()
                        Rectangle()
                    }
                }
            }
            .shadow(color: shadow.opacity(opacity), radius: radius, x: offset, y: offset / 2)
            .offset(x: offset)
    }
}

#Preview {
    GTTextView(text: "Test", alignment: .top, offset: 0, opacity: 1.0, shadow: .blue, radius: 10)
}
