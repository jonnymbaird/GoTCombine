//
//  UIView+addSubviews.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 02/04/2021.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            addSubview(view)
        }
    }
}
