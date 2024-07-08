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
        VStack(spacing: 15) {
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

            HStack(spacing: 0) {
                StickyHeaderCustomButton(symbolImage: "rectangle.portrait.and.arrow.forward", title: "Deposit") {

                }

                StickyHeaderCustomButton(symbolImage: "dollarsign", title: "Withdraw") {

                }

                StickyHeaderCustomButton(symbolImage: "qrcode", title: "QR Code") {

                }

                StickyHeaderCustomButton(symbolImage: "qrcode.viewfinder", title: "Scanning") {

                }
            }
            .padding(.top, 10)
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
    StickyHeaderContentView()
}
