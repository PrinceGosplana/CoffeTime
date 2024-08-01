//
//  ThemeChangeContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.07.2024.
//

import SwiftUI

struct ThemeChangeContentView: View {
    @State private var changeThemes: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Apperance")
                } header: {
                    Button("Change Theme") {
                        changeThemes.toggle()
                    }
                }

            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $changeThemes, content: {
            ThemeChangeView()
            /// Since max height is 410
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ThemeChangeContentView()
}
