//
//  HomeRouter.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

class HomeRouter: BaseRouter {
    
    weak var viewController: HomeViewController?
    
    override func createModule(data: [String : Any]? = nil) -> BaseViewController {
        let view: BaseViewController & HomeView = HomeViewController()
        let presenter: HomePresentation & HomeInteractorOutput = HomePresenter()
        let interactor: HomeUseCase = HomeInteractor()
        let router: HomeWireFrame = self
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        viewController = view as? HomeViewController
        return view
    }
}

extension HomeRouter: HomeWireFrame {
    
    func navigateToDetail(data: [String : Any]) {
        guard let viewController = viewController else { return }
        let detailView = DetailNewsViewController()
        detailView.data = data
        detailView.modalPresentationStyle = .fullScreen
        viewController.present(detailView, animated: true)
    }
    
}
