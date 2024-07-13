//
//  HAEHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.07.2024.
//

import SwiftUI

struct HAEHomeView: View {
    @State private var allProfiles: [HeroProfile] = HeroProfile.mocks

    var body: some View {
        NavigationStack {
            List(allProfiles) { profile in
                HStack(spacing: 12) {
                    Image(profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 6) {
                        Text(profile.userName)
                            .fontWeight(.semibold)

                        Text(profile.lastMsg)
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                }
                .onTapGesture {

                }
            }
            .navigationTitle("Progress Effect")
        }
    }
}

#Preview {
    HAEContentVeiw()
}
