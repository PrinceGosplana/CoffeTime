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

    /// Time and changing stories based on timer
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    /// Progress
    @State var timerProgress: CGFloat = 0

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(bundle.stories[0].imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(
                HStack(spacing: 13) {

                    Image(bundle.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())

                    Text(bundle.profileImage)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Spacer()
                    
                    Button {
                        withAnimation {
                            storyData.showStory = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
                    .padding()
                , alignment: .topTrailing
            )
            .overlay(
                HStack(spacing: 5) {
                    ForEach(bundle.stories) { _ in
                        Capsule()
                            .fill(.gray.opacity(0.5))
                    }
                }
                    .frame(height: 1.4)
                    .padding(.horizontal)
                )
            .rotation3DEffect(
                getAngle(proxy: proxy),
                                      axis: (x: 0.0, y: 1.0, z: 0.0),
                                      anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing,
                                      perspective: 2.5
            )
            .onReceive(timer) { _ in
                /// updating seen status on realtime
                if storyData.currentStory == bundle.id {
                    if !bundle.isSeen {
                        bundle.isSeen = true
                    }

                    /// updating timer
                    if timerProgress < CGFloat(bundle.stories.count) {
                        timerProgress += 0.03
                    }
                }
            }
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
