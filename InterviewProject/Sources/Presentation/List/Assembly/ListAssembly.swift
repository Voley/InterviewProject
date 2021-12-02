
import Foundation
import UIKit
import RxSwift

class ListAssembly : ListAssemblyProtocol {
    
    static func createModule(_ navigationController: UINavigationController) -> UIViewController {
        
        let disposeBag = DisposeBag()
        
        let networkService = RatesNetworkService()
        let repository = RatesRepository(networkService: networkService)
        let router = ListRouter(navigationController)
        let interactor = ListInteractor(repository)
        let presenter = ListPresenter(interactor, disposeBag, router)
        
        let viewController = ListViewController()
        viewController.output = presenter
        
        presenter.view = viewController
        
        return viewController
    }
}
