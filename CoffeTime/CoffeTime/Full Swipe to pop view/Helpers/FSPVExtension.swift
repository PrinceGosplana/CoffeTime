//
//  FSPVExtension.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 17.09.2024.
//

import SwiftUI

extension View {
    func fullSwipePop<Content: View>(show: Binding<Bool>, content: @escaping () -> Content ) -> some View {
        
        return FSPVFullSwipePopHelper(mainContent: self, content: content(), show: show)
    }
}
