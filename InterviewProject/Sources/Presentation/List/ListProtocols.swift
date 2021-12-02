
import Foundation
import UIKit
import RxSwift


// MARK: - Assembly

protocol ListAssemblyProtocol: AnyObject {
    
    static func createModule(with: ListModuleDependencies) -> UIViewController
}


// MARK: - View

protocol ListViewOutput: AnyObject {
    
    func viewDidLoad()
    func updateData()
    func didSelectItemAt(_ index: Int)
}

protocol ListViewInput: AnyObject {
    
    func hideRefreshControl()
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func updateWith(_ models: [RateCellViewModel])
    func showError(_ errorString: String)
}


// MARK: - Interactor

protocol ListInteractorInput: AnyObject {
    
    func downloadData() -> Single<RatesResponse>
}

protocol ListInteractorOutput: AnyObject {
    
    func didSelectItem()
    func handle(_ error: Error)
}


// MARK: - Router

protocol ListRouterInput: AnyObject {
    
    func showDetailsScreenWith(_ item: RateItem)
}

