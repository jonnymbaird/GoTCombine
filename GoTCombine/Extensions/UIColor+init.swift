//
//  UIColor+init.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 02/04/2021.
//

import UIKit

extension UIColor {
    convenience init(redInt: CGFloat, greenInt: CGFloat, blueInt: CGFloat, alpha: CGFloat) {
        self.init(red: redInt/255, green: greenInt/255, blue: blueInt/255, alpha: alpha)
    }
}
