
import Foundation
import UIKit

class ListRouter: ListRouterInput {
    
    weak var navigationController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showDetailsScreenWith(_ item: RateItem) {
        guard let navController = navigationController else { return }
        let viewController = DetailsAssembly.createModuleWith(item)
        navController.pushViewController(viewController, animated: true)
    }
}
