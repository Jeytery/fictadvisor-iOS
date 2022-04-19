//
//  Icons.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit

class Icons {
    static func Icon(
        _ name: String,
        renderingMode: UIImage.RenderingMode = .alwaysTemplate
    ) -> UIImage {
        return UIImage(named: name)!.withRenderingMode(renderingMode)
    }
    
    static let plus = Icon("plus")
    
    
    static let close = Icon("close")
    
    static let avatar = Icon("avatar")
    
    
    static let home = Icon("home")
    static let loopa = Icon("loopa")
    static let settings = Icon("settings")
    
    
}
