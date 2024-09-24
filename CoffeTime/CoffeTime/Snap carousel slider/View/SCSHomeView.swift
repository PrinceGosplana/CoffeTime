//
//  SCSHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 24.09.2024.
//

import SwiftUI

struct SCSHomeView: View {
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 12) {
                Button {

                } label: {
                    Label {
                        Text("Back")
                            .fontWeight(.semibold)
                    } icon: {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                    }
                    .foregroundStyle(.primary)
                }

                Text("My Wishes")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    SCSContentView()
}
