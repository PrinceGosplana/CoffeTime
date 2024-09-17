//
//  FSPVHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 17.09.2024.
//

import SwiftUI

struct FSPVHomeView: View {

    @State private var show = false
    @State var currentDay: Int = 1

    var body: some View {
        NavigationStack {
            List {
                ForEach(1...25, id: \.self) { index in
                    Button {
                        currentDay = index
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
            List {
                ForEach(1...25, id: \.self) { index in
                    Text("Course \(index)")
                }
            }
        }
    }
}

#Preview {
    FSPVContentView()
}
