//
//  WUISForecastView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.09.2024.
//

import SwiftUI

struct WUISForecastView: View {
    let time: String
    let celcius: Int
    let imageName: String

    var body: some View {
        VStack(spacing: 8) {
            WUISCustomStackView {
                Label {
                    Text("Hourly Forecast")
                } icon: {
                    Image(systemName: "clock")
                }
            } contentView: {
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 15) {
                        Text(time)
                            .font(.callout.bold())
                            .foregroundStyle(.white)

                        Image(systemName: imageName)
                            .font(.title2)
                        /// Multicolor icon
                            .symbolVariant(.fill)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.yellow, .white)
                            .frame(height: 30)

                        Text("\(celcius)")
                            .font(.callout.bold())
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    WUISForecastView(time: "12 PM", celcius: 94, imageName: "sun.min")
}
