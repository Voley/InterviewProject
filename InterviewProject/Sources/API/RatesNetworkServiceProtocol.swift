
import Foundation
import RxSwift

protocol RatesNetworkServiceProtocol {
    func downloadRates() -> Single<RatesResponse>
}
