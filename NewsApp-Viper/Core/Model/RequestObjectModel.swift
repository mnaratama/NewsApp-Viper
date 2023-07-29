//
//  RequestObjectModel.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation
import Alamofire

struct RequestObjectModel {
    var method: HTTPMethod
    var path: String
    var param: [String: Any]
}
