//
//  AnchorKey.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 10.07.2024.
//

import SwiftUI

//This is used to retrieve the size and position information about the SwiftUI view and with the help of that we can implement the hero effect
struct AnchorKey: PreferenceKey {
    
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    static func reduce(value: inout [String : Anchor<CGRect>], nextValue: () -> [String : Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}
