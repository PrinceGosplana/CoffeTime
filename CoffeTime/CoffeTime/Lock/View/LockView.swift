//
//  LockView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 21.07.2024.
//

import SwiftUI

struct LockView<Content: View>: View {
    /// Lock Properties
    let lockType: LockType
    let lockPin: String
    let isEnabled: Bool
    var lockWhenAppGoesBackground: Bool = true
    @State private var pin: String = ""
    var forgotPin: () -> () = { }
    @ViewBuilder let content: Content
    
    var body: some View {
        GeometryReader {
            let size = $0.size

            content
                .frame(width: size.width, height: size.height)

            if isEnabled {
                Rectangle()
                    .ignoresSafeArea()
                
                ZStack {
                    if lockType == .both || lockType == .biometric {
                    } else {
                        /// Custom number pad to type view lock pin
                        NumberPadPin(forgotPin: forgotPin)
                    }
                }
            }
        }
    }

    /// Lock Type
    enum LockType: String {
        case biometric = "Bio Metric Auth"
        case number = "Custom Number Lock"
        case both = "First preference will be biometric, and if it's not available, it will go for number lock"
    }
}

#Preview {
    LockContentView()
}
