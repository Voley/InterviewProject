
import Foundation
import RxSwift
import UIKit

class RatesRepository: RatesRepositoryPorotocol {
    
    private let networkService: RatesNetworkServiceProtocol
    
    public init(networkService: RatesNetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func downloadRates() -> Single<RatesResponse> {
        return networkService.downloadRates()
    }
}
