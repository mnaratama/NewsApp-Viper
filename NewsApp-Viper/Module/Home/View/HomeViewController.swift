//
//  HomeViewController.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var presenter: HomePresentation?
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var errorSearchNews: UILabel!
    
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
        errorSearchNews.isHidden = true
    }
    
    private func setupTableView() {
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.delegate = self
        newsTableView.dataSource = self
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

extension HomeViewController: HomeView {
    func showAlert(message: String) {
        DispatchQueue.main.async {
            self.showAlertView(message: message)
        }
    }
    
    func showErrorSearch(isHidden: Bool) {
        errorSearchNews.isHidden = isHidden
    }
    
    func showLoading() {
        self.showLoading(self.view)
    }
    
    func hideLoading() {
        self.hideLoading(self.view)
    }
    
    func reloadTableView() {
        newsTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.topHeadlineArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let news = presenter?.topHeadlineArray else { return UITableViewCell() }
        
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.setData(news: news[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let news = presenter?.topHeadlineArray else { return }
        presenter?.navigateToDetail(data: news[indexPath.row])
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getCategoryCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let category = presenter?.categoryList else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setupContent(category: category[indexPath.row])
        cell.callback = { [weak self] selectedCategory in
            self?.presenter?.category = selectedCategory.lowercased()
            self?.presenter?.getNews()
        }
        
        return cell
    }
}
