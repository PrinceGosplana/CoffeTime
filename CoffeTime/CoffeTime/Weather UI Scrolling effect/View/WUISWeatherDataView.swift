//
//  WUISWeatherDataView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.09.2024.
//

import SwiftUI

struct WUISWeatherDataView: View {
    var body: some View {
        VStack(spacing: 8) {
            WUISCustomStackView {
                Label {
                    Text("Air Quality")
                } icon: {
                    Image(systemName: "circle.hexagongrid.fill")
                }
            } contentView: {
                VStack(alignment: .leading, spacing: 10) {
                    Text("143 - Moderately Polluted")
                        .font(.title3.bold())

                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.white)
            }

            HStack {
                WUISCustomStackView {
                    Label {
                        Text("UV Index")
                    } icon: {
                        Image(systemName: "sun.min")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("0")
                        Text("Low")
                    }
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }

                WUISCustomStackView {
                    Label {
                        Text("Rainfall")
                    } icon: {
                        Image(systemName: "drop.fill")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("0 mm")
                            .font(.title)
                        Text("In last 24 hours")
                            .font(.title3)
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)

            WUISCustomStackView {
                Label {
                    Text("10-Day Forecast")
                } icon: {
                    Image(systemName: "calendar")
                }
            } contentView: {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(DayForecast.mock) { cast in
                        VStack {
                            WUISCastCell(cast: cast)

                            Divider()
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    WUISContentView()
}
