
import Foundation

struct RateCellViewModel {
    
    static let cellIdentifier = "RateCell"
    
    let name: String
    let price: String
    let exchangeName: String
    let rateItem: RateItem
    
    init(_ rateItem: RateItem) {
        self.name = rateItem.name
        self.price = CurrencyFormatter.formattedPrice(rateItem.price)
        self.exchangeName = rateItem.exchangeName
        self.rateItem = rateItem
    }
}
