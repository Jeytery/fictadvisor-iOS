//
//  TabViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit

class TabViewController: UITabBarController {
        
    private lazy var tabControllers = [
        NavigationController(
            rootViewController: HomeViewController(),
            buttonSide: .dontShow,
            withBigTitle: true
        ),
        NavigationController(
            rootViewController: SearchModule(),
            buttonSide: .dontShow,
            withBigTitle: true
        ),
        NavigationController(
            rootViewController: SettingsViewController(),
            buttonSide: .dontShow,
            withBigTitle: true
        )
    ]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureViewControllers()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ui
extension TabViewController {
    private func configureViewControllers() {
        setViewControllers(tabControllers, animated: false)
    }
}

