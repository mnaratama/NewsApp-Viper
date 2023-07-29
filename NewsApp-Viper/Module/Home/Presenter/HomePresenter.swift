//
//  HomePresenter.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

class HomePresenter {

    weak var view: HomeView?
    var interactor: HomeUseCase?
    var router: HomeWireFrame?
    
    var topHeadlineArray: [NewsModel] = [NewsModel]()
    var category: String = CategoryType.general.rawValue
    var categoryList: [CategoryType] = [
        .business,
        .entertainment,
        .general,
        .health,
        .science,
        .sports,
        .technology
    ]
    var searchText: String = ""
    var pageSize: Int = 100
    
    private var model: HomeModel?
}

extension HomePresenter: HomePresentation {
    var refreshControl: UIRefreshControl {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    var selectedCategory: CategoryType? {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    func viewDidLoad() {
        getNews()
    }
    
    func getNews() {
        var param: [String: Any] = [String: Any]()
        param["category"] = category
        param["pageSize"] = pageSize
        view?.showLoading()
        interactor?.getNews(param: param)
    }
    
    func navigateToDetail(data: NewsModel) {
        var param: [String: Any] = [String: Any]()
        param["news"] = data
        router?.navigateToDetail(data: param)
    }
    
    func getCategoryCount() -> Int {
        return categoryList.count
    }
    
    func searchNews(searchText: String) {
        let unfiltered = model?.news ?? []
        
        let filteredNews = unfiltered.filter { news in
            return news.title?.lowercased().contains(searchText.lowercased()) ?? true
        }
        
        if filteredNews.isEmpty && !searchText.isEmpty {
            view?.showErrorSearch(isHidden: false)
        } else {
            view?.showErrorSearch(isHidden: true)
        }
        
        self.topHeadlineArray = searchText.isEmpty ? unfiltered : filteredNews
            
        view?.reloadTableView()
    }
}

extension HomePresenter: HomeInteractorOutput {
    func successGetNews(data: [NewsModel]) {
        view?.hideLoading()
        topHeadlineArray.append(contentsOf: data)
        model = HomeModel(news: data)
        view?.reloadTableView()
    }
    
    func errorGetNews(message: String) {
        view?.hideLoading()
        view?.showAlert(message: message)
    }
}
