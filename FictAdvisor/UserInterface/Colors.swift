//
//  Colors.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import Foundation
import UIKit

class Colors {
    
    static let primary: UIColor = Color(hex: "#478cfc")
    
    static let background = Color("Background")
    
    static let primaryInterface = Color("PrimaryInterface")
    static let secondaryInterface = Color("SecondaryInterface")
    
    static let monophrome = Color("Monophrome")
}

//MARK: - colors infrastructure
extension Colors {
    static func Color(_ name: String) -> UIColor {
        guard #available(iOS 11.0, *) else { return .white }
        return UIColor(named: name) ?? .white
    }
    
    static func Color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    static func Color(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


