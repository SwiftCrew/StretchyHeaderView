//
//  StretchyHeaderView.swift
//  StretchyHeader
//
//  Created by Mohd Tahir on 25/07/19.
//  Copyright © 2019 Mohd Tahir. All rights reserved.
//

import UIKit

class StretchyHeaderView: UICollectionReusableView {

    var animator: UIViewPropertyAnimator!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupVisualEffectBlur()
    }
    
    // MARK:- add visual effect view
    private func setupVisualEffectBlur() {
        self.animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            guard let strongSelf = self else { return }

            // treat this area as the end state of your animation
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            strongSelf.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        self.animator.fractionComplete = 0
    }
}
