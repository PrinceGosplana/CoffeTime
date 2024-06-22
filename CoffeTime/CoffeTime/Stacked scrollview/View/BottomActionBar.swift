//
//  BottomActionBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct BottomActionBar: View {
    var body: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "flashlight.off.fill")
                    .font(.title3)
                    .frame(width: 35, height: 35)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black.opacity(0.6))
            .buttonBorderShape(.circle)

            Spacer(minLength: 0)

            Button {

            } label: {
                Image(systemName: "camera.fill")
                    .font(.title3)
                    .frame(width: 35, height: 35)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black.opacity(0.6))
            .buttonBorderShape(.circle)
        }
    }
}

#Preview {
    BottomActionBar()
}
