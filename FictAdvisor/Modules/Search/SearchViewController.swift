//
//  SearchViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit

func SearchModule() -> SearchViewController {
    let vc = SearchViewController()
    vc.presenter = SearchPresenter()
    return vc
}

protocol SearchViewControllerInput: AnyObject {
    func displayTeachers(_ teachers: Teachers)
}

struct SearchResult {
    
}

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenterInput!
    
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionCell<SearchResultView>.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let title = searchController.searchBar.text ?? ""
        API.shared.search(title) {
            _ in 
        }
        print("Searching with: " + (searchController.searchBar.text ?? ""))
    }
}


extension SearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionCell<SearchResultView>()
        cell.baseView.configure(title: "123", icon: Icons.avatar)
        return cell
    }
}
