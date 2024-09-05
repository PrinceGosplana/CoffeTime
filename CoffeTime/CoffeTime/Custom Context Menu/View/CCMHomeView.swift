//
//  CCMHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.09.2024.
//

import SwiftUI

struct CCMHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                CustomContextMenu {
                    /// content
                    Label {
                        Text("Unlock me")
                    } icon: {
                        Image(systemName: "lock.fill")
                    }
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                } preview: {
                    Text("Hello, user!")
                } actions: {
                    return UIMenu(title: "", children: [])
                }
            }
        }
    }
}

#Preview {
    CCMContentView()
}
