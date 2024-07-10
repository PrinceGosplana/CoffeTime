//
//  UHEContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.07.2024.
//

import SwiftUI

struct UHEContentView: View {
    @State private var showView: Bool = false

    var body: some View {
        VStack {
            SourceView(id: "View 1") {
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        showView.toggle()
                    }
            }
        }
        .padding()
        .sheet(isPresented: $showView, content: {
            DestinationView(id: "View 2") {
                Circle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        showView.toggle()
                    }
            }
            .padding(15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            /// This effect must disable all the native dismiss interactions, such as the sheet interactive dismiss and navigation back button
            .interactiveDismissDisabled()
        })
    }
}

#Preview {
    UHEContentView()
}
