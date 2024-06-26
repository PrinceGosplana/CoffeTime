//
//  CustomTextField.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.06.2024.
//

import SwiftUI

struct CustomTextField: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    /// hides TextField
    var isPassword: Bool = false
    @Binding var value: String

    /// View properties
    @State private var showPassword: Bool = false

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
            /// slightly bringing down
                .offset(y: 2)

            VStack(alignment: .leading, spacing: 8) {
                if isPassword {
                    Group {
                        /// revealing password when users wants to show password
                        if showPassword {
                            TextField(hint, text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }
                    }
                } else {
                    TextField(hint, text: $value)
                }

                Divider()
            }
            .overlay(alignment: .trailing) {
                Button {
                    withAnimation {
                        showPassword.toggle()
                    }
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundStyle(.gray)
                        .padding(10)
                        .contentShape(.rect)
                }
            }
        }
    }
}

#Preview {
    CustomTextField(sfIcon: "person", hint: "hint", value: .constant("test"))
}
