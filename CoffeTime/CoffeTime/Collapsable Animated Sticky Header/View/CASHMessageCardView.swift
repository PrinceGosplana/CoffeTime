//
//  CASHMessageCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 19.09.2024.
//

import SwiftUI

struct CASHMessageCardView: View {

    let message: CASHMessage

    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .fill(message.tintColor)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 8) {
                Text(message.userName)
                    .fontWeight(.bold)

                Text(message.message)
                    .foregroundStyle(.secondary)
            }
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CASHMessageCardView(message: CASHMessage.mock[0])
}
