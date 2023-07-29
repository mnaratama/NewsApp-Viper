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
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var errorSearchNews: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        headerView.dropShadow()
        searchView.roundedCorner(cornerRadius: 10)
        errorSearchNews.isHidden = true
    }
    
    private func setupTableView() {
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    @IBAction func categoryButtonTapped(_ sender: Any) {
        presenter?.presentCategoryPicker()
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (presenter?.topHeadlineArray.count ?? 0) - 1 {
            presenter?.getNews()
            DispatchQueue.main.async {
                let lastListIndexPath = IndexPath(row: (self.presenter?.topHeadlineArray.count ?? 0) - 1, section: 0)
                self.newsTableView.scrollToRow(at: lastListIndexPath, at: .bottom, animated: true)
            }
        }
    }
}

//extension HomeViewController: CategoryPickerPopUpDelegate {
//    func selectPicker(categoryName: String) {
//        if let categories = presenter?.categoryList.first(where: { $0.rawValue == categoryName }){
//            presenter?.selectedCategory = categories
//            presenter?.category = categoryName.lowercased()
//            presenter?.getNews()
//        }
//    }
//}

