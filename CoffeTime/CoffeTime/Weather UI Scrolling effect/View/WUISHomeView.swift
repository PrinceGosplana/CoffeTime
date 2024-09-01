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

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    /// Weather data
                    VStack(alignment: .center, spacing: 5) {
                        Text("San Jose")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)

                        Text(" 98 ")
                            .font(.system(size: 45))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)

                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)

                        Text("H: 103 L:105")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                    }

                    VStack(spacing: 8) {
                        WUISCustomStackView {
                            Label {
                                Text("Hourly Forecast")
                            } icon: {
                                Image(systemName: "clock")
                            }
                        } contentView: {
                            ScrollView(.horizontal, showsIndicators: false) {

                                HStack(spacing: 15) {
                                    /// Custom data view
                                    WUISForecastView(time: "12 PM", celcius: 24, imageName: "sun.min")

                                    WUISForecastView(time: "1 PM", celcius: 25, imageName: "sun.haze")

                                    WUISForecastView(time: "2 PM", celcius: 26, imageName: "sun.min")

                                    WUISForecastView(time: "3 PM", celcius: 26, imageName: "cloud.sun")

                                    WUISForecastView(time: "4 PM", celcius: 25, imageName: "sun.haze")
                                }
                            }
                        }
                    }

                    
                }
                .padding(.top, 25)
                .padding([.horizontal, .bottom])
            }
        }
    }
}

#Preview {
    WUISContentView()
}
