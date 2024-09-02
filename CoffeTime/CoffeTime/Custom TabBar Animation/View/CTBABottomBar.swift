//
//  CTBABottomBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

struct CTBABottomBar: View {

    @EnvironmentObject var bottomBarModel: CTBABottomBarViewModel
    
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

                Image(systemName: "magnifyingglass")
                    .font(.callout)
                    .foregroundStyle(.primary)

                TextField("", text: $bottomBarModel.searchText)

                Image(systemName: "lock")
                    .symbolVariant(.fill)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Button {

                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .tint(.primary)
                }

                Button {

                } label: {
                    Image(systemName: "square.on.square")
                        .font(.title2)
                        .tint(.primary)
                }
            }
            .preferredColorScheme(.dark)
            .padding(.horizontal)
        }
        .frame(height: 60)
        .padding([.horizontal])
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    CTBABottomBar()
        .environmentObject(CTBABottomBarViewModel())
}
