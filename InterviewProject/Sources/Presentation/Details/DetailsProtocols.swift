
import Foundation
import UIKit
import RxSwift

// MARK: - View

protocol DetailsViewOutput: AnyObject {
    
    func viewDidLoad()
}

protocol DetailsViewInput: AnyObject {
    
    func updateWith(_ viewModel: DetailsViewModel)
}

// MARK: - Interactor

protocol DetailsInteractorInput: AnyObject {
    
}

protocol DetailsInteractorOutput: AnyObject {
    
}

// MARK: - Router

protocol DetailsRouterInput: AnyObject {
    
}

// MARK: - Assembly

protocol DetailsAssemblyProtocol: AnyObject {
    
    static func createModuleWith(_ item: RateItem) -> UIViewController
    
}
