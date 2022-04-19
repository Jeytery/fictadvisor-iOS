//
//  TeachersViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit

func TeachersModule() -> TeachersViewController {
    let vc = TeachersViewController()
    vc.presenter = TeachersPresenter()
    return vc
}

protocol TeacherViewControllerInput: AnyObject {
    func displayTeachers(_ teachers: Teachers)
}

class TeachersViewController: UIViewController {
    
    var presenter: TeachersPresenterInput!
    
    private let collectionView = CollectionView(title: "no_results".localized)
    
    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .white
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search artists"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        
        configureCollectionView()
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "teachers".localized
        tabBarItem = .init(title: nil, image: Icons.loopa, selectedImage: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints() {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension TeachersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let title = searchController.searchBar.text ?? ""
        API.shared.search(title) {
            _ in 
        }
        print("Searching with: " + (searchController.searchBar.text ?? ""))
    }
}

