
import Foundation
import UIKit
import RxSwift

class DetailsAssembly : DetailsAssemblyProtocol {
    
    static func createModuleWith(_ item: RateItem) -> UIViewController {
        
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter(interactor, item)
        
        let storyboard = UIStoryboard(name: "Details", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? DetailsViewController else {
            return UIViewController()
        }
        
        viewController.output = presenter
        
        presenter.view = viewController
        
        return viewController
    }
}
