//
//  SwipeContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.07.2024.
//

import SwiftUI

struct SwipeContentView: View {
    var body: some View {
        NavigationStack {
            SwipeHomeView()
                .navigationTitle("Message")
        }
    }
}

#Preview {
    SwipeContentView()
}
