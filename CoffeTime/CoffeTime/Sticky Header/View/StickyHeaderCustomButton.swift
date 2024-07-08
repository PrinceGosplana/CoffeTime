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
    let onClick: () -> Void

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
        }
        .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    StickyHeaderCustomButton()
//}
