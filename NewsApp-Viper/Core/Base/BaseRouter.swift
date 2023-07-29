//
//  BaseRouter.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import Foundation

class BaseRouter {
    
    required public init() { }
    
    func createModule(data: [String: Any]? = nil) -> BaseViewController {
        return BaseViewController()
    }
}
