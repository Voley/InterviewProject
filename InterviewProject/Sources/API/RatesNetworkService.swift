
import Foundation
import RxSwift

class RatesNetworkService: RatesNetworkServiceProtocol {
    
    func downloadRates() -> Single<RatesResponse> {
        
        let url = URL(string: "https://www.cryptingup.com/api/markets/")!
        
        return Single<RatesResponse>.create { single in
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
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
