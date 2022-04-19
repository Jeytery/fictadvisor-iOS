//
//  CollectionCell.swift
//  FictAdvisor
//
//  Created by Jeytery on 19.04.2022.
//

import UIKit
import SnapKit

class CollectionCell<T: UIView>: UICollectionViewCell {
    
    private(set) var baseView: T!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let _view = T()
        setView(_view)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setView(_ _view: T) {
        self.baseView = _view
        contentView.addSubview(baseView)
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        baseView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        baseView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
