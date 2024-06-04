//
//  FindCollectionView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.06.2024.
//

import SwiftUI

struct FindCollectionView: UIViewRepresentable {
    var result: (UICollectionView) -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if let collectionView = view.collectionSuperView {
                result(collectionView)
            }
        }
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
