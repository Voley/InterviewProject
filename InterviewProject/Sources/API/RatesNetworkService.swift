
import Foundation
import RxSwift

// Документация по апи - https://www.cryptingup.com/apidoc/#get-a-specific-asset

class RatesNetworkService: RatesNetworkServiceProtocol {

    private let url: URL

    init(url: URL) {
        self.url = url
    }
    
    func downloadRates() -> Single<RatesResponse> {

        return Single<RatesResponse>.create { single in
            
            let task = URLSession.shared.dataTask(with: self.url) { data, response, error in
                    if let error = error {
                        single(.failure(error))
                        return
                    }
                    
                if let data = data {
                    let decoder = JSONDecoder()
                    if let parsedResult = try? decoder.decode(RatesResponse.self, from: data) {
                        single(.success(parsedResult))
                    } else {
                        single(.failure(DataParsingError.errorParsingData))
                        return
                    }
                }
            }
            task.resume()
            return Disposables.create {}
        }
    }
}

enum DataParsingError: Error {
    case errorParsingData
}
