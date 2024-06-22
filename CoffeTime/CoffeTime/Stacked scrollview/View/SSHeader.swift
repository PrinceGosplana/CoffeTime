//
//  SSHeader.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct SSHeader: View {

    let topPadding: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            Text(Date.now.formatted(date: .complete, time: .omitted))
                .font(.title3.bold())

            Text("9:40")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .padding(.top, -15)
        }
        .foregroundStyle(.white)
        .visualEffect { content, geometryProxy in
            content
                .offset(y: headerOffset(geometryProxy, topPadding))
        }
    }

    /// Header offset
    /// This will keep the header view at the top until the scrollview is not close to it. When the scrollview reaches the header view, the header view will scroll along with it
    func headerOffset(_ proxy: GeometryProxy, _ topPadding: CGFloat) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let viewSize = proxy.size.height

        return -minY > (topPadding - viewSize) ? -viewSize : -minY - topPadding
    }
}

#Preview {
    SSHeader(topPadding: 0)
}
