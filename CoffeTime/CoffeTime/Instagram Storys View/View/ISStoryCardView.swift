//
//  ISStoryCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 21.09.2024.
//

import SwiftUI

struct ISStoryCardView: View {

    @Binding var bundle: ISStoryBundle
    @EnvironmentObject var storyData: ISStoryViewModel

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(bundle.stories[0].imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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
            .rotation3DEffect(
                getAngle(proxy: proxy),
                                      axis: (x: 0.0, y: 1.0, z: 0.0),
                                      anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing,
                                      perspective: 2.5
            )
        }
    }

    private func getAngle(proxy: GeometryProxy) -> Angle {
        let progress = proxy.frame(in: .global).minX / proxy.size.width
        let rotationAngle: CGFloat = 45
        let degrees = rotationAngle * progress
        return Angle(degrees: Double(degrees))
    }
}

#Preview {
    ISStoryCardView(bundle: .constant(ISStoryBundle.darkUser))
        .environmentObject(ISStoryViewModel())
}
