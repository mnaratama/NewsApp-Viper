//
//  HomeInteractor.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

class HomeInteractor {
    
    weak var presenter: HomeInteractorOutput?
    
    private let service: NewsServiceProtocol = NewsService()
}

extension HomeInteractor: HomeUseCase {
    
    func getNews(param: [String : Any]) {
        service.getHomeNews(param: param) { [weak self] response in
            if let data = response?.articles {
                self?.presenter?.successGetNews(data: data)
            }
        } error: { [weak self] err in
            self?.presenter?.errorGetNews(message: err)
        }
    }
}
