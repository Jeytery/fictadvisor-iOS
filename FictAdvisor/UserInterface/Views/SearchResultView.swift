//
//  SearchResultView.swift
//  FictAdvisor
//
//  Created by Jeytery on 19.04.2022.
//

import UIKit
import SnapKit

class SearchResultView: UIView {
    
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(iconView)
        iconView.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(25)
            $0.right.equalToSuperview().offset(-20)
        }
        
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = Colors.monophrome
        
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(iconView.snp.left).offset(-20)
        }
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(title: String, icon: UIImage) {
        titleLabel.text = title
        iconView.image = icon
    }
}

class TeacherView: SearchResultView {
    
}

class SubjectView: SearchResultView {
    
}
