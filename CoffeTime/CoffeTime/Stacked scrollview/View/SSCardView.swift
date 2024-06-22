//
//  CardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct SSCardView: View {
    let item: SSItem

    var body: some View {
        if item.logo.isEmpty {
            Rectangle()
                .fill(.clear)
        } else {
            HStack(spacing: 12) {
                Image(item.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.callout)
                        .fontWeight(.bold)

                    Text(item.description)
                        .font(.caption)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
            .frame(maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 20))
        }
    }
}

#Preview {
    SSContentView()
}
