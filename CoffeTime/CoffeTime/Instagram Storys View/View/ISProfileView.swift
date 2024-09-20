//
//  ISProfileView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.09.2024.
//

import SwiftUI

struct ISProfileView: View {

    @Binding var bundle: ISStoryBundle
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject var storyData: ISStoryViewModel

    var body: some View {
        Image(bundle.profileImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        /// Progress ring showing only is not seen
            .padding(2)
            .background(scheme == .dark ? .black : .white, in: Circle())
            .padding(3)
            .background(
                LinearGradient(colors: [ .red, .orange, .red, .orange], startPoint: .top, endPoint: .bottom)
                    .clipShape(Circle())
                    .opacity(bundle.isSeen ? 0 : 1)
            )
            .onTapGesture {
                withAnimation {
                    bundle.isSeen = true

                    /// saving current bundle and toggling story
                    storyData.currentStory = bundle.id
                    storyData.showStory = true
                }
            }
    }
}

#Preview {
    ISProfileView(bundle: .constant(ISStoryBundle.yellowUser))
}
