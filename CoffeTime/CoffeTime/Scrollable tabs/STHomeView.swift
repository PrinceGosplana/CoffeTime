//
//  STHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.08.2024.
//

import SwiftUI

struct STHomeView: View {

    @State private var selectedTab: STTab?
    @State private var tabProgress: CGFloat = 0

    var body: some View {
        VStack {
            /// Here we add custom tabbar
            HStack(spacing: 0) {
                ForEach(STTab.allCases, id: \.rawValue) { tab in
                    HStack(spacing: 10) {
                        Text(tab.title)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .contentShape(.capsule)
                    .foregroundStyle(selectedTab == tab ? .white : .black)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = tab
                        }
                    }
                }
            }
            .background {
                GeometryReader {
                    let size = $0.size
                    let capsuleWidth = size.width / CGFloat(STTab.allCases.count)

                    Capsule()
                        .frame(width: capsuleWidth)
                        .offset(x: tabProgress * (size.width - capsuleWidth))
                }
            }
            .background(.gray.opacity(0.1), in: .capsule)
            .padding(.horizontal, 1)
            .tabMask(tabProgress, tabsCount: STTab.allCases.count)

            GeometryReader {
                let size = $0.size

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        sampleView(.gray)
                            .id(STTab.chats)
                            .containerRelativeFrame(.horizontal)

                        sampleView(.gray)
                            .id(STTab.calls)
                            .containerRelativeFrame(.horizontal)

                        sampleView(.gray)
                            .id(STTab.settings)
                            .containerRelativeFrame(.horizontal)
                    }
                    .scrollTargetLayout()
                    .offsetX { value in
                        let progress = -value / (size.width * CGFloat(STTab.allCases.count - 1))

                        tabProgress = max(min(progress, 1), 0)
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: $selectedTab)
                .scrollClipDisabled()
            }
        }
        .padding()
        .onAppear { selectedTab = .chats }
    }

    @ViewBuilder
    func sampleView(_ color: Color) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(1...20, id: \.self) { _ in
                HStack {
                    Circle()
                        .fill(color.gradient)
                        .frame(width: 44)

                    VStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(color.gradient)
                            .frame(height: 10)

                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(color.gradient)
                            .frame(width: 200, height: 8)
                    }
                }
                .frame(height: 70)
            }
        }
        .scrollClipDisabled()
        .mask {
            Rectangle()
                .padding(.bottom, -100)
        }
        .padding()
    }
}

#Preview {
    STContentView()
}
