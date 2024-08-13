//
//  SHContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import SwiftUI

struct SHContentView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets

            SHHomeView(size: size, safeArea: safeArea)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    SHContentView()
}
