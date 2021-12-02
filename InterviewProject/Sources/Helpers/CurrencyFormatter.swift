
import Foundation


class CurrencyFormatter {
    
    static let numberFormatter = NumberFormatter()
    
    static func formattedPrice(_ priceDouble: Double) -> String {
        
        Self.numberFormatter.usesGroupingSeparator = true
        Self.numberFormatter.numberStyle = .currency
        Self.numberFormatter.locale = Locale.current
        Self.numberFormatter.currencySymbol = "$ "
        
        guard let priceString = Self.numberFormatter.string(from: NSNumber(value: priceDouble)) else { return "" }
        
        return priceString
    }
}
