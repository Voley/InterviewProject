
import Foundation

struct RateItem: Codable {
    
    let name: String
    let price: Double
    let yesterdayPrice: Double
    let exchangeName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "base_asset"
        case price = "price"
        case exchangeName = "exchange_id"
        case yesterdayPrice = "price_unconverted"
    }
}
