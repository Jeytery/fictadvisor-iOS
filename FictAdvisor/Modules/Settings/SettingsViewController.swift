//
//  SettingsViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 19.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Settings"
        tabBarItem = .init(title: nil, image: Icons.settings, selectedImage: nil)
        
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
