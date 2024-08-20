//
//  CarouselSliderContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.08.2024.
//

import SwiftUI

struct CarouselSliderContentView: View {
    var body: some View {
        NavigationStack {
            CarouselSliderHome()
                .navigationTitle("Carousel")
        }
    }
}

#Preview {
    CarouselSliderContentView()
}
