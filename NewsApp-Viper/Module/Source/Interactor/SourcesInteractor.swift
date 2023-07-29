//
//  SourcesInteractor.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

class SourceInteractor {
    weak var presenter: SourcesInteractorOutput?
    
    private let service: NewsServiceProtocol = NewsService()
}

extension SourceInteractor: SourcesUseCase {
    func getSourceNews(param: [String : Any]) {
        service.getSourcesNews(param: param) { [weak self] response in
            if let data = response?.sources {
                self?.presenter?.successGetSourcesNews(data: data)
            }
        } error: { [weak self] err in
            self?.presenter?.errorGetSourceNews(message: err)
        }
    }
}
