//
//  ASSContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.09.2024.
//

import SwiftUI

struct ASSContentView: View {
    var body: some View {
        ASSSplashScreenView(imageSize: CGSize(width: 128, height: 128)) {
            ASSHomeView()
        } titleView: {
            Text("Music")
                .font(.system(size: 35).bold())
                .foregroundStyle(.white)
        } logoView: {
            Image(.vinylRecord)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } navButton: {
            Button {

            } label: {
                Image(.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }
        }

    }
}

#Preview {
    ASSContentView()
}
