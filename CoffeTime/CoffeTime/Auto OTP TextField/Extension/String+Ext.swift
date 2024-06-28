//
//  String+Ext.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 28.06.2024.
//

import SwiftUI

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            self.wrappedValue = String(self.wrappedValue)
        }
        return self
    }
}
