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
        .overlay {
            if #available(iOS 17, *) {
                CircleView(showSignup: showSignup)
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
            } else {
                CircleView(showSignup: showSignup)
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
            }
        }
    }
}

#Preview {
    LoginContentView()
}
