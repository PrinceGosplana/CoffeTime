//
//  WPHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.09.2024.
//

import SwiftUI

struct WPHomeView: View {

    let screenSize: CGSize
    @State var offset: CGFloat = 0

    /// Expanding index based on
    private var getIndex: Int {
        let progress = round(offset / screenSize.width)
        return min(Int(progress), WPIntro.mocks.count - 1)
    }

    /// Offset for indicator
    private var getIndicatorOffset: CGFloat {
        let progress = offset / screenSize.width
        let maxWidth: CGFloat = 12 + 7
        return progress * maxWidth
    }

    var body: some View {
        VStack {

            Button {

            } label: {
                Image(.pacmanBlack128)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            WPOffsetPageTabView(offset: $offset) {

                HStack(spacing: 0) {
                    ForEach(WPIntro.mocks) { intro in
                        VStack {
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)

                            VStack(alignment: .leading, spacing: 22) {
                                Text(intro.title)
                                    .font(.largeTitle.bold())

                                Text(intro.description)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(width: screenSize.width)
                    }
                }
            }

            /// Animated indicator
            HStack(alignment: .bottom) {

                /// Indicators
                HStack(spacing: 12) {
                    ForEach(WPIntro.mocks.indices, id: \.self) { index in
                        Capsule()
                            .fill(.white)
                            // increasing width for only current index
                            .frame(width: getIndex == index ? 20 : 7, height: 7)
                    }
                }
                .overlay(
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 7)
                        .offset(x: getIndicatorOffset)
                    , alignment: .leading
                )
                .offset(x: 10, y: -15)


                Spacer()

                Button {
                    updateOffset()
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .padding(20)
                        .background(
                            WPIntro.mocks[getIndex].color,
                            in: Circle()
                        )
                }
            }
            .padding()
            .offset(y: -20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .animation(.easeInOut, value: getIndex)
    }

    private func updateOffset() {
        let index = min(getIndex + 1, WPIntro.mocks.count - 1)
        offset = CGFloat(index) * screenSize.width
    }
}

#Preview {
    WPContentView()
}
