//
//  ESAHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.06.2024.
//

import SwiftUI

struct ESAHomeView: View {

    @State private var scrollRect: CGRect = .zero

    var body: some View {
        NavigationStack {
            GeometryReader {
                let size = $0.size

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 18) {
                        ForEach(Message.mock) {
                            MessageRow($0)
                                .elasticScroll(scrollRect: scrollRect, screenSize: size)
                        }
                    }
                    .padding(15)
                    .offsetExtractor(coordinateSpace: "SCROLLVIEW") {
                        scrollRect = $0
                    }
                }
                .coordinateSpace(name: "SCROLLVIEW")
            }
            .navigationTitle("Messanger")
        }
    }

    /// Message Row view
    @ViewBuilder
    private func MessageRow(_ message: Message) -> some View {
        HStack(spacing: 15) {
            Image(message.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            /// online status
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .fill(.green.gradient)
                        .frame(width: 15, height: 15)
                        .shadow(color: .primary.opacity(0.1), radius: 5, x: 5, y: 5)
                        .opacity(message.online ? 1 : 0)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(message.name)
                    .font(.callout)
                    .fontWeight(.bold)

                Text(message.message)
                    .font(.caption)
                    .foregroundStyle(message.read ? .gray : .black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    NavigationStack {
        ESAHomeView()
            .navigationTitle("Message")
            .navigationBarTitleDisplayMode(.large)
    }
}
