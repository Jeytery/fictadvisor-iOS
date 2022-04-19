//
//  NavigationController.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit
import SnapKit

class NavigationController: UINavigationController {

    enum ButtonSide {
        case left
        case right
        case dontShow
    }
    
    @objc func action() { dismiss(animated: true, completion: nil) }
    
    init(
        rootViewController: UIViewController,
        buttonSide: ButtonSide = .right,
        withBigTitle: Bool = true
    ) {
        super.init(rootViewController: rootViewController)
        configureCloseButton(side: buttonSide)
        navigationBar.prefersLargeTitles = true
        navigationBar.tintColor = Colors.primary
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension NavigationController {
    private func CloseButton() -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        
        view.addSubview(imageView)
        view.backgroundColor = .white
        view.layer.cornerRadius = 30 / 2
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(13)
        }
        
        imageView.image = Icons.close
        imageView.tintColor = Colors.primary

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(action)))
        return view
    }
    
    private func configureCloseButton(side: ButtonSide) {
        let customButton = UIButton()
        customButton.setImage(Icons.plus, for: .normal)
        customButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        let barView = UIBarButtonItem(customView: CloseButton())
                                      
        barView.customView?.translatesAutoresizingMaskIntoConstraints = false
        barView.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        barView.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        if side == .right {
            topViewController?.navigationItem.rightBarButtonItem = barView
        }
        else if side == .left {
            topViewController?.navigationItem.leftBarButtonItem = barView
        }
    }
}
