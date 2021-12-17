
import Foundation

struct RateItem: Codable, RateItemDescriptionProtocol {
    
    func printDescription() {
        print("Rate item named \(name), priced: \(price)")
    }
    
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


protocol RateItemDescriptionProtocol {
    var name: String { get }
    
    func printDescription()
}

extension RateItemDescriptionProtocol {
    
    func printDescription() {
        print("Rate Item named \(name)")
    }
}


