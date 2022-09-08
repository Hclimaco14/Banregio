//
//  DebitAccountViewController.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

protocol DebitAccountDisplayLogic {
    func displayAccounts(accounts: [DebitAccount])
}

class DebitAccountViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var accountTableView: UITableView!
    
    // MARK: - Variables
    
    var interactor: DebitAccountBusinessLogic?
    var router: DebitAccountRoutingLogic?
    
    var debitAccounts: [DebitAccount] = [] {
        didSet {
            DispatchQueue.main.async {
                self.accountTableView.reloadData()
            }
        }
    }
    // MARK: - Object Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTable()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getAccounts()
    }
    
    // MARK: - Configurators
    
    func configureTable() {
        self.accountTableView.register(UINib(nibName: DebitCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: DebitCell.identifier)
        self.accountTableView.dataSource = self
        
    }
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = DebitAccountInteractor()
        let presenter       = DebitAccountPresenter()
        let router          = DebitAccountRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    // MARK: - Private
    
    
    // MARK: - Actions
    
    @IBAction func goToLaons(_ sender: Any) {
        router?.routeToLoans()
    }
    
}

extension DebitAccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debitAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DebitCell.identifier, for: indexPath) as? DebitCell else {
            return UITableViewCell()
        }
        
        cell.account = debitAccounts[indexPath.row]
        
        return cell
    }
    
    
}

extension DebitAccountViewController: DebitAccountDisplayLogic {
    func displayAccounts(accounts: [DebitAccount]){
        self.debitAccounts = accounts
    }
}
