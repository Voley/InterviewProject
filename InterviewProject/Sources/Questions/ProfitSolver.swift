
import Foundation

//struct RateItem: Codable {
//
//    let name: String
//    let price: Double
//    let yesterdayPrice: Double
//    let exchangeName: String
//}

class ProfitSolver {
    
    let items: [RateItem]
    
    init(_ rateItems: [RateItem]) {
        items = rateItems
    }
    
    // У каждой монеты есть текущая цена - price и вчерашняя цена - yesterdayPrice
    // Задача в том чтобы определить какую максимальную прибыль мы бы
    // могли получить, если бы вчера купили 10 монет, а сегодня продали
    
    func maximumProfitFromTenCoins() -> Double {
        
        return 0
    }
    
    // Те же условия что и в первой задаче, но у нас есть ограничение по сумме, которую мы
    // могли бы вчера потратить
    
    func maximumProfitWithLimitedSum(_ sum: Int) -> Double {
        
        return 0
    }
}
