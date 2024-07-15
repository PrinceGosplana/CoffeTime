//
//  HAEHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.07.2024.
//

import SwiftUI

struct HAEHomeView: View {
    @State private var allProfiles: [HeroProfile] = HeroProfile.mocks

    /// Detail properties
    @State private var selectedProfile: HeroProfile?
    @State private var showDetail = false
    @State private var heroProgress: CGFloat = 0
    @State private var showHeroView = true

    var body: some View {
        NavigationStack {
            List(allProfiles) { profile in
                HStack(spacing: 12) {
                    Image(profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .opacity(selectedProfile?.id == profile.id ? 0 : 1)
                        .anchorPreference(key: AnchorKey.self, value: .bounds, transform: { anchor in
                            [profile.id.uuidString: anchor]
                        })

                    VStack(alignment: .leading, spacing: 6) {
                        Text(profile.userName)
                            .fontWeight(.semibold)

                        Text(profile.lastMsg)
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                }
                .onTapGesture {
                    selectedProfile = profile
                    showDetail = true

                    withAnimation(.snappy(duration: 0.35, extraBounce: 0), completionCriteria: .logicallyComplete) {
                        heroProgress = 1.0
                    } completion: {
                        Task {
                            try? await Task.sleep(for: .seconds(0.1))
                            showHeroView = false
                        }
                    }
                }
            }
            .navigationTitle("Progress Effect")
        }
        .overlay {
            HAEDetailView(
                selectedProfile: $selectedProfile,
                heroProgress: $heroProgress,
                showDetail: $showDetail, 
                showHeroView: $showHeroView
            )
        }
        /// Hero animation layer
        .overlayPreferenceValue(AnchorKey.self,
                                {
            value in
            GeometryReader { geometry in
                /// Let's check whether we have both source and destination frames
                if let selectedProfile,
                   let source = value[selectedProfile.id.uuidString],
                   let destination = value["DESTINATION"] {
                    let sourceRect = geometry[source]
                    let radius = sourceRect.height / 2
                    let destinationRect = geometry[destination]
                    
                    let diffSize = CGSize(
                        width: destinationRect.width - sourceRect.width,
                        height: destinationRect.height - sourceRect.height
                    )

                    let diffOrigin = CGPoint(
                        x: destinationRect.minX - sourceRect.minX,
                        y: destinationRect.minY - sourceRect.minY
                    )

                    /// Hero view here is just a profile image
                    Image(selectedProfile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: sourceRect.width + (diffSize.width * heroProgress),
                            height: sourceRect.height + (diffSize.height * heroProgress)
                        )
                        .clipShape(.rect(cornerRadius: radius))
                        .offset(
                            x: sourceRect.minX + (diffOrigin.x * heroProgress),
                            y: sourceRect.minY + (diffOrigin.y * heroProgress)
                        )
                        .opacity(showHeroView ? 1 : 0)
                }
            }
        })
    }
}

#Preview {
    HAEContentVeiw()
}
