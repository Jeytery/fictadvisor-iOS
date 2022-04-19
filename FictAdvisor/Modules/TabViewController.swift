//
//  TabViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit

class TabViewController: UITabBarController {
        
    private let icons = [Icons.avatar, Icons.settings, Icons.settings]
    
    private lazy var tabControllers = [
        NavigationController(
            rootViewController: HomeViewController(),
            buttonSide: .dontShow,
            withBigTitle: true
        ),
        NavigationController(
            rootViewController: TeachersModule(),
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
        //configureIcons()
        tabBar.items?.forEach() {
            _ in
            //$0.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0);
        }
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

    private func configureIcons() {
        guard let items = tabBar.items else { return }
        for i in 0..<items.count {
            let item = items[i]
            item.title = ""
            item.image = icons[i]
            
        }
        
        tabBar.items?.forEach() {
            
            $0.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0);
        }
    }
}

