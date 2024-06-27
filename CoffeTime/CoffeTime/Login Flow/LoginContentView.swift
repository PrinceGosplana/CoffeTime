//
//  LoginContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.06.2024.
//

import SwiftUI

struct LoginContentView: View {

    @State private var showSignup: Bool = false

    var body: some View {
        NavigationStack {
            LoginView(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    
                }
        }
    }
}

#Preview {
    LoginContentView()
}
