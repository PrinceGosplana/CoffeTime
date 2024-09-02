//
//  CTBABottomBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

struct CTBABottomBar: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.regularMaterial)
                .preferredColorScheme(.dark)

            HStack(spacing: 15) {
                Button {

                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .tint(.primary)
                }
                .padding(.trailing, 10)

                Button {

                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .tint(.primary)
                }

                Button {

                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.callout)
                        .tint(.primary)
                }
            }
            .preferredColorScheme(.dark)
        }
        .frame(height: 60)
        .padding([.horizontal])
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    CTBABottomBar()
}
