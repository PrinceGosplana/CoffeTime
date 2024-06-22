//
//  SSContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct SSContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(.theGreatWave)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                SSHomeView()
            }
        }
    }
}

#Preview {
    SSContentView()
}
