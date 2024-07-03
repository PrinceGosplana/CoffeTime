//
//  LoginContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.06.2024.
//

import SwiftUI

struct LoginContentView: View {

    @State private var showSignup: Bool = false
    @State private var openMainScreen: Bool = false

    var body: some View {
        Group {
            if openMainScreen {
                ESAHomeView()
            } else {
                NavigationStack {
                    LoginView(showSignup: $showSignup, openMainScreen: $openMainScreen)
                        .navigationDestination(isPresented: $showSignup) {
                            Signup(showSignup: $showSignup, openMainScreen: $openMainScreen)
                        }
                }
                .overlay {
                    if #available(iOS 17, *) {
                        PawView(showSignup: showSignup)
                            .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
                    } else {
                        PawView(showSignup: showSignup)
                            .animation(.easeInOut(duration: 0.3), value: showSignup)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginContentView()
}
