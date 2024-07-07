//
//  StickyHeaderView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.07.2024.
//

import SwiftUI

struct StickyHeaderView: View {
    let safeAreaTop: CGFloat
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")

                    TextField("Search", text: .constant(""))
                        .tint(.white)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.black)
                        .opacity(0.15)
                }

                Button {

                } label: {
                    Image(.user2)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .background {
                            Circle()
                                .fill(.white)
                                .padding(-2)
                        }
                }
            }
        }
        .environment(\.colorScheme, .dark)
        .padding([.horizontal, .bottom], 15)
        .padding(.top, safeAreaTop + 10)
        .background {
            Rectangle()
                .fill(.red.gradient)
        }
    }
}

#Preview {
    StickyHeaderView(safeAreaTop: 0)
}
