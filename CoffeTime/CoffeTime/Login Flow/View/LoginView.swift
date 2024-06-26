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

            Spacer(minLength: 0)
        }
    }
}

#Preview {
    LoginContentView()
}
