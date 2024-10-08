//
//  CTBABottomBarViewModel.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

enum CTBABottomState {
    case floating, expanded
}

class CTBABottomBarViewModel: ObservableObject {
    @Published var searchText = "Waterflow"
    @Published var offset: CGFloat = 0
    @Published var lastStoredOffset: CGFloat = 0
    @Published var tabState: CTBABottomState = .floating
}
