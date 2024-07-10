//
//  View+Ext.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.07.2024.
//

import SwiftUI

extension View {
    
    /// custom modifiers for handling the onChange modifier

    @ViewBuilder
    func customOnChange<Value: Equatable>(value: Value, completion: @escaping (Value) -> ()) -> some View {
        if #available(iOS 17, *) {
            self
                .onChange(of: value) { oldValue, newValue in
                    completion(newValue)
                }
        } else {
            self
                .onChange(of: value) { newValue in
                    completion(newValue)
                }
        }
    }

    @ViewBuilder
    func heroLayer<Content: View>() -> some View {
        self
    }
}
