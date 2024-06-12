//
//  SideMenuContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 11.06.2024.
//

import SwiftUI

struct SideMenuContentView: View {

    /// View properties
    @State private var showMenu: Bool = false

    var body: some View {
        AnimatedSideBar(
            rotatesWhenExpands: true,
            disablesInteraction: true,
            sideMenuWidth: 200,
            cornerRadius: 25,
            showMenu: $showMenu) { safeArea in
                NavigationStack {
                    List {
                        NavigationLink("Detail View") {
                            Text("Hello there!")
                                .navigationTitle("Detail")
                        }
                    }
                    .navigationTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                showMenu.toggle()
                            } label: {
                                Image(systemName: showMenu ? "xmark" : "line.3.horizontal")
                                    .foregroundStyle(Color(.systemGray))
                                    .contentTransition(.symbolEffect)
                            }
                        }
                    }
                }
            } menuView: { safeArea in

            } background: {
                Rectangle()
                    .fill(.sideMenu)
            }

    }
}

#Preview {
    SideMenuContentView()
}
