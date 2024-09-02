//
//  CTBAContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

struct CTBAContentView: View {
    var body: some View {
        /// Since we need the bottom edge we will use geometry reader
        GeometryReader { proxy in
            CTBAHomeView(proxy: proxy)
        }
    }
}

#Preview {
    CTBAContentView()
}
