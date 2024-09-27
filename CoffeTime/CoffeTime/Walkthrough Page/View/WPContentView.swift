//
//  WPContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.09.2024.
//

import SwiftUI

struct WPContentView: View {
    var body: some View {
        GeometryReader { proxy in

            let size = proxy.size

            WPHomeView(screenSize: size)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    WPContentView()
}
