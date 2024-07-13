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
                ImageView()
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
                ImageView()
                    .onTapGesture {
                        expandSheet.toggle()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            .interactiveDismissDisabled()
        })
        .heroLayer(id: item.id.uuidString, animate: $expandSheet) {
            ImageView()
        } completion: { _ in

        }

    }

    @ViewBuilder
    func ImageView() -> some View {
        Image(systemName: item.symbol)
            .font(.title2)
            .foregroundStyle(.white)
            .frame(width: 40, height: 40)
            .background(item.color.gradient, in: .circle)
    }
}

#Preview {
    HeroCardView(item: HeroItem.mocks[0])
}
