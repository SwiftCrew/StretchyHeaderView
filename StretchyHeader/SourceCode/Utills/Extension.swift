//
//  Extension.swift
//  StretchyHeader
//
//  Created by Mohd Tahir on 25/07/19.
//  Copyright © 2019 Mohd Tahir. All rights reserved.
//

import UIKit

extension UIView {
    
    static var nibName: String {
        
        return self.description().components(separatedBy: ".").last ?? ""
    }
    
    static var identifier: String {
        
        return self.nibName
    }
    
    // Fill View
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}
