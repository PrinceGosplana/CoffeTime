//
//  CarousalItemView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.06.2024.
//

import SwiftUI

struct CarousalItemView: View {

    @State var item: CarousalItem
    @Binding var selectedItem: CarousalItem?
    @Namespace private var namespace
    private var expanded: Bool {
        item.id == selectedItem?.id
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image(item.posterImage)
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(expanded ? 1.5 : 1, anchor: .topLeading)
                    .frame(width: expanded ? 250 : 150, height: 200)
                    .matchedGeometryEffect(id: "image", in: namespace, anchor: .topLeading, isSource: true)
                    .opacity(expanded ? 0 : 1)

                Image(item.stillImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: expanded ? 250 : 150, height: 200)
                    .matchedGeometryEffect(id: "image", in: namespace, anchor: .topLeading, isSource: false)
                    .opacity(expanded ? 1 : 0)
                    .overlay (alignment: .leading) {
                        if expanded {
                            itemDetailsView()
                        }
                    }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 0.5)
            }
            .clipShape(.rect(cornerRadius: 10))

            Text(item.title)
                .frame(height: 50)
                .lineLimit(1)
                .shadow(color: .black, radius: 2, x: 1, y: 1)
        }
    }

    @ViewBuilder private func itemDetailsView() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()

            Group {
                Text(item.title)
                    .font(.title2)

                HStack {
                    Text("C8FC: " + item.certification)
                        .padding(.horizontal, 5)
                        .overlay {
                            Rectangle()
                                .stroke(.white, lineWidth: 1)
                        }
                    Text(item.runtime)
                    Text(item.year)
                }
            }
            .shadow(color: .black, radius: 2, x: 1, y: 1)

            HStack(spacing: 10) {
                Group {
                    Button("Trailer") {}
                    Button("Watch now") {}
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.white)
                }
            }
            .padding(.bottom, 15)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    CarousalItemView(item: CarousalItem.items[0], selectedItem: .constant(CarousalItem.items[0]))
}
