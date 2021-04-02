//
//  UITableViewCell+reuseIdentifier.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 02/04/2021.
//

import UIKit

extension UITableViewCell {
    public class var reuseIdentifier: String  {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
