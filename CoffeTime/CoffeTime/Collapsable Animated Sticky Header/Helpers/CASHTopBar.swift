//
//  CASHTopBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 18.09.2024.
//

import SwiftUI

struct CASHTopBar: View {

    let topEdge: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            Image(.girl3)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            Text("Lidiya")
                .font(.largeTitle.bold())

            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .fontWeight(.semibold)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .padding(.bottom)

    }
}
