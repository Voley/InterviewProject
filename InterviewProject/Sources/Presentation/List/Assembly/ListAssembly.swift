
import Foundation
import UIKit
import RxSwift

class ListAssembly : ListAssemblyProtocol {
    
    static func createModule(with dependencies: ListModuleDependencies) -> UIViewController {
        
        let disposeBag = DisposeBag()
        
        let networkService = RatesNetworkService(url: dependencies.url)
        let repository = RatesRepository(networkService: networkService)
        let router = ListRouter(dependencies.navigationController)
        let interactor = ListInteractor(repository)
        let presenter = ListPresenter(interactor, disposeBag, router)
        
        let viewController = ListViewController()
        viewController.output = presenter
        
        presenter.view = viewController
        
        return viewController
    }
}
