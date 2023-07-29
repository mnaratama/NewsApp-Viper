//
//  ServiceManager.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

protocol NewsServiceProtocol {
    
    func getHomeNews(param: [String: Any], success: @escaping (ResponseModel<[NewsModel]>?) -> Void, error: @escaping (String) -> Void)
    func getSourcesNews(param: [String: Any], success: @escaping (ResponseModel<[SourcesNewsModel]>?) -> Void, error: @escaping (String) -> Void)
    
}

struct NewsService: NewsServiceProtocol {
    
    static let sharedInstance = NewsService()
    private var api = NetworkManager.sharedInstance
    
    func getHomeNews(param: [String: Any], success: @escaping (ResponseModel<[NewsModel]>?) -> Void, error: @escaping (String) -> Void) {
        api.request(type: NewsModel.self, request: RequestObjectModel(method: .get, path: Router.RoutesHome, param: param)) { result, list in
            success(list)
        } errorBlock: { status, err in
            error(err)
        }
    }
    
    func getSourcesNews(param: [String : Any], success: @escaping (ResponseModel<[SourcesNewsModel]>?) -> Void, error: @escaping (String) -> Void) {
        api.request(type: SourcesNewsModel.self, request: RequestObjectModel(method: .get, path: Router.RoutesSources, param: param)) { result, list in
            success(list)
        } errorBlock: { status, err in
            error(err)
        }
    }
}
