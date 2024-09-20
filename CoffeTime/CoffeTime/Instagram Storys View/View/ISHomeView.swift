//
//  ISHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.09.2024.
//

import SwiftUI

struct ISHomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        Button {

                        } label: {
                            Image(.instagram128)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: "plus")
                                        .padding(4)
                                        .background(.blue, in: Circle())
                                        .foregroundStyle(.white)
                                        .padding(2)
                                        .background(.white, in: Circle())
                                        .offset(x: 8, y: 6)
                                    , alignment: .bottomTrailing
                                )
                        }
                    }
                    .padding()
                    .padding(.top, 10)
                }
            }
            .navigationTitle("Instagram")
        }
    }
}

#Preview {
    ISContentView()
}
