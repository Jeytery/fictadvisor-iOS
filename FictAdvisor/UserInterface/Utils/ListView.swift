//
//  ListView.swift
//  FictAdvisor
//
//  Created by Jeytery on 19.04.2022.
//

import UIKit
import SnapKit

protocol ListViewDataSource: AnyObject {
    
    func listView(_ listView: ListView, numberOfRowsInSection section: Int) -> Int
    
    func listView(_ listView: ListView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

    func numberOfSections(in listView: UITableView) -> Int
    
    func listView(_ listView: ListView, titleForHeaderInSection section: Int) -> String?

    func listView(_ listView: ListView, titleForFooterInSection section: Int) -> String?

    func listView(_ listView: ListView, canEditRowAt indexPath: IndexPath) -> Bool

    func listView(_ listView: ListView, canMoveRowAt indexPath: IndexPath) -> Bool

    func sectionIndexTitles(for tableView: UITableView) -> [String]?

    func listView(_ listView: ListView, sectionForSectionIndexTitle title: String, at index: Int) -> Int

    func listView(_ listView: ListView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    
    func listView(_ listView: ListView, cellInsetsAt indexPath: IndexPath) -> UIEdgeInsets
    
    func listView(_ listView: ListView, didCreate cell: UITableViewCell, at indexPath: IndexPath)
}

extension ListViewDataSource {
    
    func listView(_ listView: ListView, numberOfRowsInSection section: Int) -> Int { 0 }
    
    func listView(_ listView: ListView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return UITableViewCell() }
    
    func numberOfSections(in listView: UITableView) -> Int { 0 }
    
    func listView(_ listView: ListView, titleForHeaderInSection section: Int) -> String? { nil }
 
    func listView(_ listView: ListView, titleForFooterInSection section: Int) -> String? { nil }

    func listView(_ listView: ListView, canEditRowAt indexPath: IndexPath) -> Bool { true }

    func listView(_ listView: ListView, canMoveRowAt indexPath: IndexPath) -> Bool { true }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? { nil }

    func listView(_ listView: ListView, sectionForSectionIndexTitle title: String, at index: Int) -> Int { 0}

    func listView(_ listView: ListView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {}
    
    func listView(_ listView: ListView, cellInsetsAt indexPath: IndexPath) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func listView(_ listView: ListView, didCreate cell: UITableViewCell, at indexPath: IndexPath) {}
}

class ListView: UITableView {
    
    enum Style {
        case insetGrouped
        case clear
    }
    
    private(set) var views: [UIView] = []
    private let listStyle: Style
 
    weak var listDataSource: ListViewDataSource?
    
    init(
        views: [UIView],
        frame: CGRect = .zero,
        style: Style = .clear
    ) {
        self.views = views
        self.listStyle = style
        
        if #available(iOS 13.0, *), style == .insetGrouped {
            super.init(frame: .zero, style: .insetGrouped)
        } else {
            super.init(frame: .zero, style: .grouped)
        }
        
        separatorStyle = .none
        allowsSelection = false
        super.dataSource = self
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension ListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = ListTableCell<UIView>(
            view: views[indexPath.section],
            edges: listDataSource?.listView(
                self,
                cellInsetsAt: indexPath
            ) ?? .init(top: 0, left: 0, bottom: 0, right: 0)
        )
        
        if listStyle == .clear { cell.backgroundColor = .clear }
        
        listDataSource?.listView(self, didCreate: cell, at: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return views.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listDataSource?.listView(self, titleForHeaderInSection: section)
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return listDataSource?.listView(self, titleForFooterInSection: section)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return listDataSource?.listView(self, canEditRowAt: indexPath) ?? true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return listDataSource?.listView(self, canMoveRowAt: indexPath) ?? true
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listDataSource?.sectionIndexTitles(for: tableView)
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return listDataSource?.listView(self, sectionForSectionIndexTitle: title, at: index) ?? 0
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        listDataSource?.listView(self, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
}

fileprivate class ListTableCell<T: UIView>: UITableViewCell {
    
    var baseView: T!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView(T())
    }
    
    init(
        view: T,
        edges: UIEdgeInsets,
        style: UITableViewCell.CellStyle = .default,
        reuseIdentifier: String? = nil
    ) {
        self.baseView = view
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView(baseView, edges: edges)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setView(
        _ _view: T,
        edges: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    ) {
        contentView.addSubview(baseView)
    
        _view.translatesAutoresizingMaskIntoConstraints = false
        _view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: edges.top).isActive = true
        _view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -edges.bottom).isActive = true
        _view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edges.left).isActive = true
        _view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edges.right).isActive = true
    }
}
