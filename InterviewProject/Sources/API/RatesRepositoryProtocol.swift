
import Foundation
import RxSwift

protocol RatesRepositoryPorotocol {
    func downloadRates() -> Single<RatesResponse>
}
