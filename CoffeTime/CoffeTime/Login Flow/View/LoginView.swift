//
//  LoginView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.06.2024.
//

import SwiftUI

struct LoginView: View {

    @State private var emailID: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer(minLength: 0)

            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)

            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)

            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email ID", value: $emailID)

                CustomTextField(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)

                Button("Forgot Password") {

                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.appYellow)
                .hSpacing(.trailing)

                /// Login button
                GradientButton(title: "Login", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)

            }
            .padding(.top, 20)

            Spacer(minLength: 0)

            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)

                Button("SignUP") {

                }
                .fontWeight(.bold)
                .tint(.appYellow)
            }
            .font(.callout)
            .hSpacing()

        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    LoginContentView()
}
