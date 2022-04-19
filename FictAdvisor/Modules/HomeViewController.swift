//
//  HomeViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 19.04.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Home"
        tabBarItem = .init(title: nil, image: Icons.home, selectedImage: nil)
        
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
