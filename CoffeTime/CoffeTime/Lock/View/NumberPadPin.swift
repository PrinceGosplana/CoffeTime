//
//  NumberPadPin.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.07.2024.
//

import SwiftUI

struct NumberPadPin: View {
    var forgotPin: () -> ()
    let maxLimit = 4
    @Binding var pin: String
    let lockPin: String
    @State private var animateField: Bool = false
    @Binding var isUnlocked: Bool

    var body: some View {
        VStack(spacing: 15) {
            Text("Enter Pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)

            /// adding wiggling animation for wrong password with keyframe animation
            HStack(spacing: 10) {
                ForEach(0..<4, id:\.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 55)
                    /// Showing Pin at each box with the help of index
                        .overlay {
                            /// Safe check
                            if pin.count > index {
                                let index = pin.index(pin.startIndex, offsetBy: index)
                                let string = String(pin[index])

                                Text(string)
                                    .font(.title.bold())
                                    .foregroundStyle(.black)
                            }
                        }
                }
            }
            .keyframeAnimator(initialValue: CGFloat.zero, trigger: animateField, content: { content, value in
                content
                    .offset(x: value)
            }, keyframes: { _ in
                CubicKeyframe(30, duration: 0.07)
                CubicKeyframe(-30, duration: 0.07)
                CubicKeyframe(20, duration: 0.07)
                CubicKeyframe(-20, duration: 0.07)
                CubicKeyframe(0, duration: 0.07)
            })
            .padding(.top, 15)
            .overlay(alignment: .bottomTrailing) {
                Button("Forgot Pin?") {
                    forgotPin()
                }
                .foregroundStyle(.white)
                .offset(y: 40)
            }
            .frame(maxHeight: .infinity)

            /// Custom number pad
            GeometryReader { _ in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                    ForEach(1...9, id:\.self) { number in
                        Button {
                            /// Adding number to pin
                            /// Max limit - 4
                            if pin.count < maxLimit {
                                pin.append("\(number)")
                            }
                        } label: {
                            Text("\(number)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .contentShape(.rect)
                        }
                        .tint(.white)
                    }

                    Button {
                        if !pin.isEmpty {
                            pin.removeLast()
                        }
                    } label: {
                        Image(systemName: "delete.backward")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .contentShape(.rect)
                    }
                    .tint(.white)

                    Button {
                        if pin.count <= maxLimit {
                            pin.append("0")
                        }
                    } label: {
                        Text("0")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .contentShape(.rect)
                    }
                    .tint(.white)

                })
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .onChange(of: pin) { oldValue, newValue in
                if newValue.count == maxLimit {
                    /// Validate pin
                    if lockPin == pin {
                        withAnimation(.snappy, completionCriteria: .logicallyComplete) {
                            isUnlocked = true
                        } completion: {
                            /// clearing pin
                            pin = ""
                        }
                    } else {
                        pin = ""
                        animateField.toggle()
                    }
                }
            }

        }
        .padding()
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    LockContentView()
}
