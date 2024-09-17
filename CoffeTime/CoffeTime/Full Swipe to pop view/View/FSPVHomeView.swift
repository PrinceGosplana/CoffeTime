//
//  FSPVHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 17.09.2024.
//

import SwiftUI

struct FSPVHomeView: View {

    @State private var show = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(1...25, id: \.self) { index in
                    Button {
                        withAnimation {
                            show.toggle()
                        }
                    } label: {
                        Text("Day \(index) of SwiftUI")
                    }
                    .foregroundStyle(.primary)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Full Swipe pop")
        }
        .fullSwipePop(show: $show) {
            Color.cyan
        }
    }
}

#Preview {
    FSPVContentView()
}
