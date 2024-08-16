//
//  SearchBarHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.08.2024.
//

import SwiftUI

struct SearchBarHomeView: View {
    @State private var searchText = ""

    @State private var activeTab: SBTab = .all
    @Environment(\.colorScheme) private var scheme
    @Namespace var animation

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(0..<30, id:\.self) { _ in
                    DummyMessageView()
                }
            }
            .safeAreaPadding(.top, 15)
            .safeAreaInset(edge: .top, spacing: 0) {
                ExpandableNavigationBar()
            }
        }
        .background(.gray.opacity(0.15))
        .contentMargins(.top, 190, for: .scrollIndicators)
    }

    /// Expandable search bar
    @ViewBuilder
    func ExpandableNavigationBar(_ title: String = "Message") -> some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)

            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)

                TextField("Search", text: $searchText)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.background)
            }

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(SBTab.allCases, id: \.rawValue) { tab in
                        Button {
                            withAnimation {
                                activeTab = tab
                            }
                        } label: {
                            Text(tab.title)
                                .font(.callout)
                                .foregroundStyle(activeTab == tab ? (scheme == .dark ? .black : .white) : Color.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 15)
                                .background {
                                    if activeTab == tab {
                                        Capsule()
                                            .fill(Color.primary)
                                            .matchedGeometryEffect(id: "ACTIVE", in: animation)
                                    }
                                }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

        }
        .padding(.top, 25)
        .safeAreaPadding(.horizontal, 15)
        .padding(.bottom, 10)
    }
}

#Preview {
    SearchBarHomeView()
}
