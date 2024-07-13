//
//  HeroCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.07.2024.
//

import SwiftUI

struct HeroCardView: View {

    var item: HeroItem
    @State private var expandSheet: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            SourceView(id: item.id.uuidString) {
                Image(systemName: item.symbol)
                    .font(.title3)
                    .frame(width: 40, height: 40)
                    .background(item.color.gradient, in: .circle)
            }

            Text(item.title)

            Spacer(minLength: 0)
        }
        .contentShape(.rect)
        .onTapGesture {
            expandSheet.toggle()
        }
        .sheet(isPresented: $expandSheet, content: {
            DestinationView(id: item.id.uuidString) {
                Image(systemName: item.symbol)
                    .font(.title2)
                    .frame(width: 40, height: 40)
                    .background(item.color.gradient, in: .circle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
        })
    }
}

#Preview {
    HeroCardView(item: HeroItem.mocks[0])
}
