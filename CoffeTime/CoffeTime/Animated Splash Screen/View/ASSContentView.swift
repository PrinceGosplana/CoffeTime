//
//  ASSContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.09.2024.
//

import SwiftUI

struct ASSContentView: View {
    var body: some View {
        ASSSplashScreenView {

        } titleView: {
            Text("Music")
                .font(.system(size: 35).bold())
                .foregroundStyle(.white)
        } logoView: {
            Image(.vinylRecord)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 128)
        }

    }
}

#Preview {
    ASSContentView()
}
