//
//  Router.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

class Router {
    
    static let apiKey = "d954a1664e82420da22ac8fc88625439"
    
    private struct Domain {
        static let baseURL = "https://newsapi.org"
    }
    
    private struct Routes {
        static let topHeadline = "/v2/top-headlines"
        static let sources = "/v2/top-headlines/sources"
    }
    
    static let BaseURL = Domain.baseURL
    static let RoutesHome = Routes.topHeadline
    static let RoutesSources = Routes.sources
}
