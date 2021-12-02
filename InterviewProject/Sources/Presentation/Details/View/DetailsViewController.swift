
import Foundation
import UIKit
import RxSwift

class DetailsViewController: UIViewController, DetailsViewInput {
    // MARK: - Public properties
    
    var output: DetailsViewOutput?
    
    // MARK: - Private Properties
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var yesterdayPriceLabel: UILabel!
    @IBOutlet var exchangeNameLabel: UILabel!
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    
    // MARK: - Public methods
    
    func updateWith(_ viewModel: DetailsViewModel) {
        title = viewModel.title
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        yesterdayPriceLabel.text = viewModel.yesterdayPrice
        exchangeNameLabel.text = viewModel.exchangeName
    }
    
    // MARK: Private Methods
}
