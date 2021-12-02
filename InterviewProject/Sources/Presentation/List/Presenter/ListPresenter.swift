
import Foundation
import RxSwift

class ListPresenter: ListViewOutput {
    
    let disposeBag: DisposeBag
    let interactor: ListInteractorInput
    let router: ListRouterInput
    weak var view: ListViewInput?
    
    var listItems: [RateCellViewModel] = []
    
    init(_ interactor: ListInteractorInput, _ disposeBag: DisposeBag, _ router: ListRouterInput) {
        self.interactor = interactor
        self.disposeBag = disposeBag
        self.router = router
    }
    
    func viewDidLoad() {
        updateData()
    }
    
    func updateData() {
        
        interactor.downloadData()
        .observe(on: MainScheduler.instance)
        .subscribe( onSuccess: { [weak self] ratesResponce in
            
            guard let self = self else { return }
            
            self.listItems = ratesResponce.rates.compactMap({ rateItem in
                return RateCellViewModel(rateItem)
            })
            
            self.view?.hideLoadingIndicator()
            self.view?.hideRefreshControl()
            self.view?.updateWith(self.listItems)
            
            
        }, onFailure: { error in
            
            // handle error
            self.view?.hideLoadingIndicator()
            self.view?.hideRefreshControl()
            
            self.view?.showError(error.localizedDescription)
            
        }, onDisposed: nil)
    
        .disposed(by: disposeBag)
    }
    
    func didSelectItemAt(_ index: Int) {
        guard index < listItems.count else { return }
        
        router.showDetailsScreenWith(listItems[index].rateItem)
    }
}
