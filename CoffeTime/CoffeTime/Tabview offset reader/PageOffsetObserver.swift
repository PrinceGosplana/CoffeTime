//
//  PageOffsetObserver.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.06.2024.
//

import SwiftUI
import UIKit

final class PageOffsetObserver: NSObject, ObservableObject {

    @Published var collectionView: UICollectionView?
    @Published var offset: CGFloat = 0
    private(set) var isObserving: Bool = false

    deinit {
        remove()
    }

    func observe() {
        guard !isObserving else { return }
        collectionView?.addObserver(self, forKeyPath: "contentOffset", context: nil)
        isObserving = true
    }

    func remove() {
        isObserving = false
        collectionView?.removeObserver(self, forKeyPath: "contentOffset")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "contentOffset" else { return }
        if let contentOffset = (object as? UICollectionView)?.contentOffset {
            offset = contentOffset.x
        }
    }
}
