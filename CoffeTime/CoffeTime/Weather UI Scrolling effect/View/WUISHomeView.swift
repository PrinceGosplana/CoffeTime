//
//  WUISHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 31.08.2024.
//

import SwiftUI

struct WUISHomeView: View {
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Image(.theGreatWave)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            /// Blur material
            .overlay(.ultraThinMaterial)
        }
    }
}

#Preview {
    WUISContentView()
}
