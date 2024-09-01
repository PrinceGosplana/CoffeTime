//
//  WUISContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 31.08.2024.
//

import SwiftUI

struct WUISContentView: View {
    var body: some View {
        // Since Window is deprecated in iOS 15 we get Safe area using Geometry reader
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top
            
            WUISHomeView(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    WUISContentView()
}
