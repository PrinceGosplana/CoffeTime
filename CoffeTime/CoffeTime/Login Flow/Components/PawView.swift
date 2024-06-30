//
//  PawView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.06.2024.
//

import SwiftUI

struct PawView: View {

    var showSignup: Bool

    var body: some View {
        Image(systemName: "pawprint.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.appBrown ?? .brown, .appLightBrown ?? .brown.opacity(0.5))
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 5)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}


#Preview {
    PawView(showSignup: false)
}
