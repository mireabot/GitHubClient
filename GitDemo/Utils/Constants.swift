//  Constants.swift
//  GitDemo
//
//  Created by Mikhail Kolkov on 14.01.21.

import Foundation
import UIKit

var searchName: String?
var searchLanguage: String?

//Default values
let defaultSearchName = "language:swift"
let defaultSearchLanguage = "Swift"
let pageItems = 100
var urlString: String = ""
let tableViewCellHeight: CGFloat = 120.0

@IBDesignable extension UINavigationController {
    @IBInspectable var barTintColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            navigationBar.barTintColor = uiColor
        }
        get {
            guard let color = navigationBar.barTintColor else { return nil }
            return color
        }
    }
}
