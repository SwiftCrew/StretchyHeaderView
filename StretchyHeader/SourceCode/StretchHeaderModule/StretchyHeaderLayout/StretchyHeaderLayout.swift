//
//  StretchyHeaderLayout.swift
//  StretchyHeader
//
//  Created by Mohd Tahir on 25/07/19.
//  Copyright © 2019 Mohd Tahir. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // Extract the layout attributes

        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        // Loop through each attribute and identify which one you want to modify
        layoutAttributes?.forEach({ (attributes) in
            
            // Check for Section Header with First Section
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {
                guard let collectionView = collectionView else { return }
                let contentOffSetY = collectionView.contentOffset.y
                
                if contentOffSetY < 0 {
                    let collectionWidth = collectionView.frame.width
                    let height = attributes.frame.height - contentOffSetY
                    // As contentOffsetY is -ve, the height will increase based on contentOffsetY
                    attributes.frame = CGRect.init(x: 0, y: contentOffSetY, width: collectionWidth, height: height)
                }
            }
        })
        return layoutAttributes
    }
    
    // Invalidate the layout for new bounds
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
    }
}
