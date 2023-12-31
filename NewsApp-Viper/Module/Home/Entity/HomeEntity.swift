//
//  HomeEntity.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

struct HomeModel {
    var news: [NewsModel]
}

struct NewsModel: Codable {
    var id: String?
    var name: String?
    var author: String?
    var title: String?
    var descriptionNews: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case author
        case title
        case descriptionNews = "description"
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

enum CategoryType: String {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
}
