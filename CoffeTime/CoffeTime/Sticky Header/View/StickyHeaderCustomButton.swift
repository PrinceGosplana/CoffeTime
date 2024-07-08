//
//  StickyHeaderCustomButton.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.07.2024.
//

import SwiftUI

struct StickyHeaderCustomButton: View {

    let symbolImage: String
    let title: String
    let offsetY: CGFloat
    let onClick: () -> Void

    /// Fading out soon than the navbar animation
    var progress: CGFloat {
        -(offsetY / 40) > 1 ? -1 : (offsetY > 0 ? 0 : (offsetY / 40))
    }

    var body: some View {
        Button {

        } label: {
            VStack(spacing: 8) {
                Image(systemName: symbolImage)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
                    .frame(width: 35, height: 35)
                    .background {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.white)
                    }

                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .opacity(1 + progress)
            // MARK: Displaying alternative icon
            .overlay {
                Image(systemName: symbolImage)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .opacity(-progress)
                    .offset(y: -10)
            }
        }
    }
}
