//
//  CASHContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 18.09.2024.
//

import SwiftUI

struct CASHContentView: View {
    var body: some View {
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top

            CASHHomeView(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    CASHContentView()
}
