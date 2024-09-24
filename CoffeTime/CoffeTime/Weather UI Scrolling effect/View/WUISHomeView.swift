//
//  WUISHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 31.08.2024.
//

import SpriteKit
import SwiftUI

struct WUISHomeView: View {

    @State var offset: CGFloat = 0
    /// to avoid early starting of landing animation
    @State var showRain = false

    let topEdge: CGFloat

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Image(.waterLiquidAzure)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            /// Blur material
            .overlay(.ultraThinMaterial)

            /// Rain fall view
            GeometryReader { _ in
                SpriteView(scene: WUISRainFall(), options: [.allowsTransparency])
            }
            .ignoresSafeArea()
            .opacity(showRain ? 1 : 0)

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
                            .opacity(getTitleOpacity())

                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())

                        Text("H: 103 L:105")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                    }
                    .offset(y: -offset)
                    /// for bottom drag effect
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)

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
                    .background {
                        GeometryReader { _ in
                            SpriteView(scene: WUISRainFallLanding(), options: [.allowsTransparency])
                                .offset(y: -6)
                        }
                        .offset(y: -(offset + topEdge) > 44 ? -(offset + (44 + topEdge)) : 0)
                    }
                    WUISWeatherDataView()

                }
                .padding(.top, 60)
                .padding([.horizontal, .bottom])
                // getting offset
                .overlay {
                    // Use Geometry reader
                    GeometryReader { proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        Task { @MainActor in
                            self.offset = minY
                        }
                        return Color.clear
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation {
                    showRain = true
                }
            }
        }
    }

    private func getTitleOpacity() -> CGFloat {
        let titleOffset = -getTitleOffset()
        let progress = titleOffset / 20
        return 1 - progress
    }

    private func getTitleOffset() -> CGFloat {
        if offset < 0 {
            /// setting one max height for whole tile...
            /// consider max as 120
            let progress = -offset / 120
            // since top padding is 25...
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            return -newOffset
        }
        return 0
    }
}

#Preview {
    WUISContentView()
}
