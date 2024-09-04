//
//  ASSHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.09.2024.
//

import SwiftUI

struct ASSHomeView: View {

    @State private var currentTab = "All Photos"
    @Namespace var animation

    var body: some View {
        VStack {
            HStack(spacing: 0) {

                ASSTabButton(title: "All Photos", animation: animation, currentTab: $currentTab)

                ASSTabButton(title: "Chats", animation: animation, currentTab: $currentTab)

                ASSTabButton(title: "Status", animation: animation, currentTab: $currentTab)
            }
            .padding(.top, 20)
            .background(Color.moon)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(PreviewSampleModel.mocks) {
                        Image($0.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                }
                .padding(15)
            }
        }
    }
}

#Preview {
    ASSHomeView()
}
