//
//  CTBAHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

struct CTBAHomeView: View {

    var proxy: GeometryProxy

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(1...7, id: \.self) { index in
                        Image("listing-\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width - 30, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                }
                .padding()
            }

            CTBABottomBar()
        }
    }
}

#Preview {
    CTBAContentView()
}
