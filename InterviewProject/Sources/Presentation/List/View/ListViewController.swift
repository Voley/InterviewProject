
import Foundation
import UIKit
import RxSwift

class ListViewController: UIViewController, ListViewInput {

    // MARK: - Public properties
    
    var output: ListViewOutput?
    var cellModels: [RateCellViewModel] = []
    
    
    // MARK: - Private Properties
    
    private let loadingView = UIActivityIndicatorView(style: .large)
    private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        
        setupTableView()
        setupActivityIndicator()
        setupRefreshControl()
        
        registerCells()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Курсы криптовалют"
        
        output?.viewDidLoad()
        showLoadingIndicator()
    }
    
    
    // MARK: - Public methods
   
    func updateWith(_ models: [RateCellViewModel]) {
        cellModels = models
        tableView.reloadData()
    }
    
    func showError(_ errorString: String) {

        let alert = UIAlertController(title: nil, message: errorString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoadingIndicator() {
        loadingView.startAnimating()
    }
    
    func hideLoadingIndicator() {
        loadingView.stopAnimating()
    }
    
    func hideRefreshControl() {
        refreshControl.endRefreshing()
    }
    
    // MARK: Private Methods
    
    @objc private func reload() {
        output?.updateData()
    }
    
    private func setupTableView() {
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupActivityIndicator() {
        view.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    private func registerCells() {
        tableView.register(RateCell.self, forCellReuseIdentifier: RateCellViewModel.cellIdentifier)
    }
}


// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelectItemAt(indexPath.row)
    }
}


// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RateCellViewModel.cellIdentifier, for: indexPath) as? RateCell
        
        guard let rateCell = cell else { return UITableViewCell() }
        
        rateCell.setModel(cellModels[indexPath.row])
        
        return rateCell
    }
}
