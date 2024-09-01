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

                    /// Custom data view
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
