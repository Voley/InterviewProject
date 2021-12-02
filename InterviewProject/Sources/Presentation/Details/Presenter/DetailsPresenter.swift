
import Foundation
import RxSwift

class DetailsPresenter: DetailsViewOutput {
    
    let interactor: DetailsInteractorInput
    weak var view: DetailsViewInput?
    
    var rateItem: RateItem
    
    init(_ interactor: DetailsInteractorInput, _ rateItem: RateItem) {
        self.interactor = interactor
        self.rateItem = rateItem
    }
    
    func viewDidLoad() {
        updateData()
    }
    
    func updateData() {
        
        let viewModel = DetailsViewModel(
            name: rateItem.name,
            price: CurrencyFormatter.formattedPrice(rateItem.price),
            yesterdayPrice: CurrencyFormatter.formattedPrice(rateItem.yesterdayPrice),
            exchangeName: rateItem.exchangeName,
            title: rateItem.name)
        
        view?.updateWith(viewModel)
    }
}
