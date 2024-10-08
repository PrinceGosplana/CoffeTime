//
//  CPSHomeView.swift
//  CoffeTime
//
//  Created by OLEKSANDR ISAIEV on 08.10.2024.
//

import SwiftUI

struct CPSHomeView: View {
    
    private var titleString: AttributedString {
        var attString = AttributedString(stringLiteral: "My Library")
        if let range = attString.range(of: "Library") {
            attString[range].font = .largeTitle.bold()
        }
        return attString
    }
    
    var standView: some View {
        Rectangle()
            .fill(.white.opacity(0.6))
            .shadow(color: .black.opacity(0.6), radius: 20, x: 0, y: 5)
            .frame(height: 10)
            .overlay(alignment: .top) {
                Rectangle()
                    .fill(.white.opacity(0.75).gradient)
                    .frame(height: 385)
                /// 3D Rotation
                    .rotation3DEffect(.init(degrees: -98), axis: (x: 1, y: 0, z: 0), anchor: .top, anchorZ: 0.5, perspective: 1)
                    .shadow(color: .black.opacity(0.08), radius: 25, x: 0, y: 5)
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 15)
            }
    }
    
    var body: some View {
        VStack {
            Text(titleString)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                standView
            }
            .padding(.horizontal, -15)
            .frame(height: 250)
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"), ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    CPSContentView()
}
