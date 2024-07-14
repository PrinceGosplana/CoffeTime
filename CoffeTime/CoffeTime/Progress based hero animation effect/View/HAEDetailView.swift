//
//  HAEDetailView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.07.2024.
//

import SwiftUI

struct HAEDetailView: View {

    @Binding var selectedProfile: HeroProfile?
    @Binding var showDetail: Bool

    /// Color scheme based background color
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        if let selectedProfile, showDetail {
            GeometryReader {
                let size = $0.size

                ScrollView(.vertical) {
                    Image(selectedProfile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: 400)
                        .clipped()
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
                .frame(width: size.width, height: size.height)
                .background {
                    Rectangle()
                        .fill(scheme == .dark ? .black : .white)
                        .ignoresSafeArea()
                }
                .overlay(alignment: .topLeading) {
                    Button {
                        showDetail.toggle()
                        self.selectedProfile = nil
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .imageScale(.medium)
                            .contentShape(.rect)
                            .foregroundStyle(.white, .black)
                    }
                    .buttonStyle(.plain)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HAEDetailView(selectedProfile: .constant(HeroProfile.mocks[0]), showDetail: .constant(true))
}
