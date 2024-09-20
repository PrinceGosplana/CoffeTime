//
//  ISStoryView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.09.2024.
//

import SwiftUI

struct ISStoryView: View {

    @EnvironmentObject var storyData: ISStoryViewModel

    var body: some View {
        if storyData.showStory {
            TabView(selection: $storyData.currentStory) {
                ForEach(storyData.stories) {
                    Image($0.stories[0].imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .overlay(
                Button {
                    withAnimation {
                        storyData.showStory = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                    .padding()
                , alignment: .topTrailing
            )
            /// transition from buttom
            .transition(.move(edge: .bottom))
        }

    }
}

#Preview {
    ISStoryView()
        .environmentObject(ISStoryViewModel())
}
