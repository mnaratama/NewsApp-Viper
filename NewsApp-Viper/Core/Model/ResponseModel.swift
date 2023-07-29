//
//  ResponseModel.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

class ResponseModel<T: Decodable>: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: T?
    var sources: T?
}
