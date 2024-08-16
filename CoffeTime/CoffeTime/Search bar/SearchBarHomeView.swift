//
//  SearchBarHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.08.2024.
//

import SwiftUI

struct SearchBarHomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(0..<30, id:\.self) { _ in
                    DummyMessageView()
                }
            }
            .safeAreaPadding(.top, 15)
            .safeAreaInset(edge: .top, spacing: 0) {

            }
        }
        .background(.gray.opacity(0.15))
        .contentMargins(.top, 190, for: .scrollIndicators)
    }
}

#Preview {
    SearchBarHomeView()
}
