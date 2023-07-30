//
//  SourcesViewController.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

class SourcesViewController: BaseViewController {
    
    var presenter: SourcesPresentation?
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var sourceTableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
        setupTableView()
        setupCollectionView()
    }
    
    private func setupView() {
        headerView.dropShadow()
        categoryContainerView.isHidden = true
        searchView.roundedCorner(cornerRadius: 10)
        errorLabel.isHidden = true
    }
    
    private func setupTableView() {
        sourceTableView.register(UINib(nibName: "SourcesTableViewCell", bundle: nil), forCellReuseIdentifier: "SourcesTableViewCell")
        sourceTableView.delegate = self
        sourceTableView.dataSource = self
    }
    
    private func setupCollectionView() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    @IBAction func categoryButtonTapped(_ sender: Any) {
        categoryContainerView.isHidden = !categoryContainerView.isHidden
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: Any) {
        presenter?.searchNews(searchText: searchTextField.text ?? "")
    }
}

extension SourcesViewController: SourcesView {
    func setAccessibilityIdentifiers() {
        searchTextField.accessibilityIdentifier = "homeSearchTextField"
        categoryCollectionView.accessibilityIdentifier = "homeCategoryCollectionView"
        categoryButton.accessibilityIdentifier = "homeCategoryButton"
        sourceTableView.accessibilityIdentifier = "homeNewsTableView"
        headerView.accessibilityIdentifier = "homeHeaderView"
        categoryContainerView.accessibilityIdentifier = "homeCategoryContainerView"
        searchView.accessibilityIdentifier = "homeSearchView"
        errorLabel.accessibilityIdentifier = "homeErrorSearchNews"
    }
    
    func reloadData() {
        sourceTableView.reloadData()
    }
    
    func showLoading() {
        self.showLoading(self.view)
    }
    
    func hideLoading() {
        self.hideLoading(self.view)
    }
    
    func showErrorSearch(isHidden: Bool) {
        errorLabel.isHidden = isHidden
    }
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            self.showAlertView(message: message)
        }
    }
}

extension SourcesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.sourcesNews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sourceNews = presenter?.sourcesNews else { return }
        presenter?.navigateToDetail(data: sourceNews[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sources = presenter?.sourcesNews else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourcesTableViewCell", for: indexPath) as! SourcesTableViewCell
        
        cell.setupContent(sources: sources[indexPath.row])
        return cell
    }
}

extension SourcesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getCategoryCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let category = presenter?.categoryArray else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setupContent(category: category[indexPath.row])
        cell.callback = { [weak self] selectedCategory in
            self?.presenter?.category = selectedCategory.lowercased()
            self?.presenter?.getSourcesNews()
        }
        
        return cell
    }
}
