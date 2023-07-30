//
//  HomeContract.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresentation? { get set }
    
    func showErrorSearch(isHidden: Bool)
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlert(message: String)
    func setAccessibilityIdentifiers()
}

protocol HomeUseCase: AnyObject {
    var presenter: HomeInteractorOutput? { get set }
    
    func getNews(param: [String: Any])
}

protocol HomeWireFrame: AnyObject {
    func createModule(data: [String: Any]?) -> BaseViewController
    
    func navigateToDetail(data: [String: Any])
}

protocol HomePresentation: AnyObject {
    var view: HomeView? { get set }
    var interactor: HomeUseCase? { get set }
    var router: HomeWireFrame? { get set }
    
    var topHeadlineArray: [NewsModel] { get set }
    var category: String { get set }
    var categoryList: [CategoryType] { get set }
    
    func viewDidLoad()
    func getNews()
    func getCategoryCount() -> Int
    func navigateToDetail(data: NewsModel)
    func searchNews(searchText: String)
}

protocol HomeInteractorOutput: AnyObject {
    func successGetNews(data: [NewsModel])
    func errorGetNews(message: String)
}
