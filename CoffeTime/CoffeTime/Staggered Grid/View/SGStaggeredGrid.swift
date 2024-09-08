//
//  SGStaggeredGrid.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.09.2024.
//

import SwiftUI

struct SGStaggeredGrid<Content: View, T: Identifiable>: View {

    let content: (T) -> Content
    let list: [T]

    init(list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.list = list
        self.content = content
    }
    var body: some View {
        VStack {
            ForEach(list) { object in
                content(object)
            }
        }
    }
}

#Preview {
    SGStaggeredGrid(list: [SGPostModel]()) { post in

    }
}
