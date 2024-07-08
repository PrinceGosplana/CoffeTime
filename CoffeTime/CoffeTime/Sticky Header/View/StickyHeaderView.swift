//
//  StickyHeaderView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.07.2024.
//

import SwiftUI

struct StickyHeaderView: View {
    let safeAreaTop: CGFloat
    // Reduced Header height will be 80
    let offsetY: CGFloat
    var progress: CGFloat {
        -(offsetY / 80) > 1 ? -1 : (offsetY > 0 ? 0 : (offsetY / 80))
    }

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
                .opacity(1 + progress)

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
                StickyHeaderCustomButton(symbolImage: "rectangle.portrait.and.arrow.forward", title: "Deposit", offsetY: offsetY) {

                }

                StickyHeaderCustomButton(symbolImage: "dollarsign", title: "Withdraw", offsetY: offsetY) {

                }

                StickyHeaderCustomButton(symbolImage: "qrcode", title: "QR Code", offsetY: offsetY) {

                }

                StickyHeaderCustomButton(symbolImage: "qrcode.viewfinder", title: "Scanning", offsetY: offsetY) {

                }
            }
            /// Shrinking horizontal
            .padding(.horizontal, -progress * 50)
            .padding(.top, 10)
            // MARK: Moving up when scrolling started
            .offset(y: progress * 65)
        }
        .environment(\.colorScheme, .dark)
        .padding([.horizontal, .bottom], 15)
        .padding(.top, safeAreaTop + 10)
        .background {
            Rectangle()
                .fill(.red.gradient)
                .padding(.bottom, -progress * 85)
        }
    }
}

#Preview {
    StickyHeaderContentView()
}
