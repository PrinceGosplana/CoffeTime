//
//  GoogleMovieCarouselView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.06.2024.
//

import SwiftUI

struct GoogleMovieCarouselView: View {

    @State private var selectedItem: CarousalItem?

    var body: some View {
        VStack {
            HStack {
                Text("Popular files")
                    .font(.title2.bold())
                    .shadow(color: .black, radius: 2, x: 1, y: 1)

                Spacer()
            }

            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(CarousalItem.items, id: \.id) { item in
                            CarousalItemView(item: item, selectedItem: $selectedItem)
                                .frame(width: selectedItem?.id == item.id ? 250 : 150, height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .contentShape(Rectangle())
                                .id(item.id)
                                .onTapGesture {
                                    DispatchQueue.main.async {
                                        withAnimation(.snappy(duration: 0.4)) {
                                            selectedItem = selectedItem?.id == item.id ? nil : item
                                        }
                                    }

                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

                                        withAnimation(.snappy(duration: 0.4)) {
                                            proxy.scrollTo(selectedItem?.id, anchor: .center)
                                        }
                                    }
                                }
                        }
                    }
                }
                .frame(height: 250)
                .scrollIndicators(.hidden)
            }

            Spacer()
        }
        .padding()
        .background {
            ZStack {
                GeometryReader {
                    let width = $0.size.width
                    let height = $0.size.height

                    Color.black

                    if let image = selectedItem?.posterImage {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: height)
                            .overlay {
                                Color.clear
                                    .background(.ultraThinMaterial)
                            }
                    }
                }
            }
            .ignoresSafeArea()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    GoogleMovieCarouselView()
}
