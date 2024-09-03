//
//  CSHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.09.2024.
//

import SwiftUI

struct CSHomeView: View {

    @State var currentTab = PreviewSampleModel.mocks[0]

    var body: some View {
        
        ZStack {
            GeometryReader { proxy in
                let size = proxy.size

                Image(currentTab.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
            }
            .ignoresSafeArea()
            /// Material effect
            .overlay(.ultraThinMaterial)
            /// Dark effect
            .preferredColorScheme(.dark)

            /// Carousel list
            TabView(selection: $currentTab) {
                ForEach(PreviewSampleModel.mocks) { model in
                    CSCarouselBodyView(previewModel: model)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

#Preview {
    CSContentView()
}
