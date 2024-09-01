//
//  WUISCastCell.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.09.2024.
//

import SwiftUI

struct WUISCastCell: View {
    let cast: DayForecast
    
    var body: some View {
        HStack(spacing: 15) {
            Text(cast.day)
                .font(.title3.bold())
                .foregroundStyle(.white)
            // max width
                .frame(width: 60, alignment: .leading)

            Image(systemName: cast.image)
                .font(.title3)
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
                .frame(width: 30)

            Text("\(Int(cast.celsius - 3))")
                .font(.title3.bold())
                .foregroundStyle(.secondary)
                .foregroundStyle(.white)

            /// Progress bar
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.tertiary)
                    .foregroundStyle(.white)

                GeometryReader { proxy in
                    Capsule()
                        .fill(.linearGradient(.init(colors: [.orange, .red]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: (cast.celsius / 50) * proxy.size.width )
                }
            }
            .frame(height: 4)

            Text("\(Int(cast.celsius))")
                .font(.title3.bold())
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    WUISCastCell(cast: DayForecast.mock[0])
        .preferredColorScheme(.dark)
}
