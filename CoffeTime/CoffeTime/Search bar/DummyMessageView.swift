//
//  DummyMessageView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.08.2024.
//

import SwiftUI

struct DummyMessageView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 140, height: 8)

                Rectangle()
                    .frame(height: 8)
                    .frame(maxWidth: .infinity)
            }
        }
        .foregroundStyle(.gray.opacity(0.4))
        .padding(.horizontal, 15)
    }
}

#Preview {
    DummyMessageView()
}
