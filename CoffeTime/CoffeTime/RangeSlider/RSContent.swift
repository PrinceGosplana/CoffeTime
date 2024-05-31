//
//  RSContent.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.05.2024.
//

import SwiftUI

struct RSContent: View {

    @State private var selection: ClosedRange<CGFloat> = 30...50

    var body: some View {
        NavigationStack {
            VStack {
                RangeSliderView(
                    selection: $selection,
                    range: 30...100,
                    minimumDistance: 0
                )

                Text("\(Int(selection.lowerBound)):\(Int(selection.upperBound))")
                    .font(.largeTitle)
                    .padding(.top, 10)
            }
            .padding()
            .navigationTitle("Range Slider")
        }
    }
}

#Preview {
    RSContent()
}
