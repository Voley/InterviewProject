
import Foundation

public struct RatesResponse: Codable {
    
    let rates: [RateItem]
    
    enum CodingKeys: String, CodingKey {
        case rates = "markets"
    }
}
