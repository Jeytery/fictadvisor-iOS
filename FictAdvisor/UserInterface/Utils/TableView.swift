//
//  TableView.swift
//  FictAdvisor
//
//  Created by Jeytery on 19.04.2022.
//

import UIKit

class TableView: UITableView {
    override init(frame: CGRect = .zero, style: UITableView.Style) {
        if #available(iOS 13.0, *) {
            super.init(frame: frame, style: .insetGrouped)
        } else {
            super.init(frame: frame, style: .grouped)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
