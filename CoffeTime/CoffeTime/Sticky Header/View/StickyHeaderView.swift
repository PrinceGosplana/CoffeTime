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
    @Binding var showSearchBar: Bool

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
                .opacity(showSearchBar ? 1 : 1 + progress)

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
                .opacity(showSearchBar ? 0 : 1)
                .overlay {
                    if showSearchBar {
                        // MARK: Displaying XMark button
                        Button {
                            showSearchBar.toggle() // false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
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
            .opacity(showSearchBar ? 0 : 1)
        }
        // MARK: Displaying search button
        .overlay(alignment: .topLeading) {
            Button {
                showSearchBar.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .offset(x: 13, y: 10)
            .opacity(showSearchBar ? 0 : -progress)
        }
        .animation(.easeInOut(duration: 0.2), value: showSearchBar)
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
