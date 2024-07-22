//
//  NumberPadPin.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.07.2024.
//

import SwiftUI

struct NumberPadPin: View {
    var forgotPin: () -> ()
    var body: some View {
        VStack(spacing: 15) {
            Text("Enter Pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)

            HStack(spacing: 10) {
                ForEach(0..<4, id:\.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 55)
                }
            }
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

                    } label: {
                        Image(systemName: "delete.backward")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .contentShape(.rect)
                    }
                    .tint(.white)

                    Button {

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

        }
        .padding()
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    LockContentView()
}
