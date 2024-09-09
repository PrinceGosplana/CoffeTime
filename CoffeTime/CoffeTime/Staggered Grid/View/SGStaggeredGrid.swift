//
//  SGStaggeredGrid.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.09.2024.
//

import SwiftUI

struct SGStaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable {

    let content: (T) -> Content
    let list: [T]

    var columns: Int
    var showsIndicators: Bool
    var spacing: CGFloat

    init(
        columns: Int,
        showsIndicators: Bool = false,
        spacing: CGFloat = 10,
        list: [T],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.columns = columns
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.list = list
        self.content = content
    }

    func setUpList() -> [[T]] {
        /// creating empty sub arrays of columns count
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        /// splitting array for VStack oriented View
        var currentIndex: Int = 0

        for object in list {
            gridArray[currentIndex].append(object)

            /// increasing index count and reseting if overbounds the columns count
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        return gridArray
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top) {
                ForEach(setUpList(), id:\.self) { columnsData in
                    LazyVStack(spacing: spacing) {
                        ForEach(columnsData) { object in
                            content(object)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

