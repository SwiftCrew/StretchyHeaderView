//
//  StretchyHeaderController.swift
//  StretchyHeader
//
//  Created by Mohd Tahir on 25/07/19.
//  Copyright © 2019 Mohd Tahir. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellId"

class StretchyHeaderController: UICollectionViewController {
    
    private let padding: CGFloat = 16
    private var stretchyHeaderView: StretchyHeaderView?
    
    // MARK: - ViewLife Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.setupCollectionViewLayout()
    }
    
    // MARK: - Private Method's
    
    // Set Collection Inset's
    private func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: self.padding, left: self.padding, bottom: self.padding, right: self.padding)
        }
    }
    
    // Register HeaderXib
    private func setupCollectionView() {
        self.collectionView.contentInsetAdjustmentBehavior = .never
        let headerNib = UINib.init(nibName: StretchyHeaderView.nibName, bundle: Bundle(for: StretchyHeaderView.self))
        self.collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StretchyHeaderView.identifier)
    }
    
    // Manage Blur effect on scrolling
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        guard let unwrapeHeader = self.stretchyHeaderView else { return }
        if contentOffsetY > 0 {
            unwrapeHeader.animator.fractionComplete = 0
            return
        }
        unwrapeHeader.animator.fractionComplete = abs(contentOffsetY) / 100
    }
    
    // Change Status bar color dark to light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - UICollectionViewDelegateFlowLayout -

extension StretchyHeaderController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - (2 * padding))
        return .init(width: width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 340)
    }
}

// MARK: UICollectionViewDataSource

extension StretchyHeaderController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        self.stretchyHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderView.identifier, for: indexPath) as? StretchyHeaderView
        return stretchyHeaderView!
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let bgColor = indexPath.row.isMultiple(of: 2) ? UIColor.black : UIColor.lightGray
        cell.backgroundColor = bgColor
        return cell
    }
}
