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
                ForEach($storyData.stories) { $bundle in
                    ISStoryCardView(bundle: $bundle)
                        .environmentObject(storyData)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .transition(.move(edge: .bottom))
        }

    }
}

#Preview {
    ISStoryView()
        .environmentObject(ISStoryViewModel())
}
