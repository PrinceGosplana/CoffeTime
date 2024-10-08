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
                let index = min(Int(timerProgress), bundle.stories.count - 1)
                let story = bundle.stories[index]

                Image(story.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(
                HStack {
                    Rectangle()
                        .fill(.black.opacity(0.01))
                        .onTapGesture {
                            /// checking and updating
                            if (timerProgress - 1) < 0 {
                                updateStory(forward: false)
                            } else {
                                timerProgress = CGFloat(Int(timerProgress - 1))
                            }
                        }

                    Rectangle()
                        .fill(.black.opacity(0.01))
                        .onTapGesture {
                            /// Checking and updating to next
                            if (timerProgress + 1) > CGFloat(bundle.stories.count) {
                                /// update to next bundle
                                updateStory()
                            } else {
                                /// update to next story
                                timerProgress = CGFloat(Int(timerProgress + 1))
                            }
                        }
                }
            )
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
                    ForEach(bundle.stories.indices) { index in
                        GeometryReader { proxy in
                            let width = proxy.size.width
                            let progress = timerProgress - CGFloat(index)
                            let perfectProgress = min(max(progress, 0), 1)

                            Capsule()
                                .fill(.gray.opacity(0.5))
                                .overlay(
                                    Capsule()
                                        .fill(.white)
                                        .frame(width: width * progress)
                                    , alignment: .leading
                                )
                        }
                    }
                }
                    .frame(height: 1.4)
                    .padding(.horizontal)
                , alignment: .top
            )
            .rotation3DEffect(
                getAngle(proxy: proxy),
                axis: (x: 0.0, y: 1.0, z: 0.0),
                anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing,
                perspective: 2.5
            )
            .onAppear(perform: {
                timerProgress = 0
            })
            .onReceive(timer) { _ in
                /// updating seen status on realtime
                if storyData.currentStory == bundle.id {
                    if !bundle.isSeen {
                        bundle.isSeen = true
                    }

                    /// updating timer
                    if timerProgress < CGFloat(bundle.stories.count) {
                        timerProgress += 0.03
                    } else {
                        updateStory()
                    }
                }
            }
        }
    }

    private func updateStory(forward: Bool = true) {
        let index = min(Int(timerProgress), bundle.stories.count - 1)
        let story = bundle.stories[index]

        if !forward {
            /// it its not first then moving backward else set timer to 0
            if let first = storyData.stories.first, first.id != bundle.id {
                let bundleIndex = storyData.stories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                } ?? 0

                withAnimation {
                    storyData.currentStory = storyData.stories[bundleIndex - 1].id
                }
            } else {
                timerProgress = 0
            }
        }
        if let last = bundle.stories.last, last.id == story.id {
            /// if there is another story then move to that else close view
            if let lastBundle = storyData.stories.last, lastBundle.id == bundle.id {
                withAnimation {
                    storyData.showStory = false
                }
            } else {
                let bundleIndeex = storyData.stories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                } ?? 0

                withAnimation {
                    storyData.currentStory = storyData.stories[bundleIndeex + 1].id
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
