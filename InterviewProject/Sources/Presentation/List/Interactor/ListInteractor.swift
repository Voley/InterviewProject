
import Foundation
import RxSwift

class ListInteractor: ListInteractorInput {
    
    let repository: RatesRepositoryPorotocol
    
    init(_ repository: RatesRepositoryPorotocol) {
        self.repository = repository
    }
    
    func downloadData() -> Single<RatesResponse> {
        return repository.downloadRates()
    }
}
