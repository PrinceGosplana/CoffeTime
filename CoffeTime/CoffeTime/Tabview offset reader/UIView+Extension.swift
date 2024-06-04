//
//  UIView+Extension.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.06.2024.
//

import UIKit

extension UIView {
    /// finding the CollectionView by traversing the superview
    var collectionSuperView: UICollectionView? {
        if let collectionView = superview as? UICollectionView {
            return collectionView
        }

        return superview?.collectionSuperView
    }
}
