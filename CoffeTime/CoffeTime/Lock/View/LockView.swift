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
    @State private var isUnlocked: Bool = false
    @State private var noBiometricAccess: Bool = false

    var forgotPin: () -> () = { }
    @ViewBuilder let content: Content
    
    var body: some View {
        GeometryReader {
            let size = $0.size

            content
                .frame(width: size.width, height: size.height)

            if isEnabled && !isUnlocked {

                ZStack {
                    Rectangle()
                        .fill(.black)
                        .ignoresSafeArea()
                    if lockType == .both || lockType == .biometric {
                        Group {
                            if noBiometricAccess {
                                Text("Enable biometric authentication in Settings to unlock the view.")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                                    .padding(50)
                            } else {
                                /// Bio metric / pin unlock
                                VStack(spacing: 12) {
                                    VStack(spacing: 6) {
                                        Image(systemName: "lock")
                                            .font(.largeTitle)

                                        Text("Tap to Unlock")
                                            .font(.caption2)
                                            .foregroundStyle(.gray)
                                    }
                                    .frame(width: 100, height: 100)
                                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
                                    .contentShape(.rect)
                                    .onTapGesture {

                                    }

                                    if lockType == .both {
                                        Text("Enter Pin")
                                            .frame(width: 100, height: 40)
                                            .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
                                            .contentShape(.rect)
                                            .onTapGesture {
                                                
                                            }
                                    }
                                }
                            }
                        }
                    } else {
                        /// Custom number pad to type view lock pin
                        NumberPadPin(forgotPin: forgotPin, pin: $pin, lockPin: lockPin, isUnlocked: $isUnlocked)
                    }
                }
                .environment(\.colorScheme, .dark)
                .transition(.offset(y: size.height + 100))
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
