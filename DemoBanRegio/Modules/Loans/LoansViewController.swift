//
//  LoansViewController.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

protocol LoansDisplayLogic {
    func displayPayments(payments:[Payment])
    func displayProcessToPaySuccess()
}

class LoansViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var loansTableView: UITableView!
    
    
    var payments: [Payment] = [] {
        didSet {
            DispatchQueue.main.async {
                self.loansTableView.reloadData()
            }
        }
    }
    
    // MARK: - Variables
    
    var interactor: LoansBusinessLogic?
    var router: LoansRoutingLogic?
    
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
        interactor?.getLoans()
    }
    
    // MARK: - Configurators
    
    func configureTable() {
        loansTableView.register(UINib(nibName: LoanCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: LoanCell.identifier)
        loansTableView.dataSource = self
    }
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = LoansInteractor()
        let presenter       = LoansPresenter()
        let router          = LoansRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    // MARK: - Private
    
    
    // MARK: - Actions
    @IBAction func aplyPaymentsAction(_ sender: Any) {
        interactor?.processToPay(payments: payments)
    }
    
}

extension LoansViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoanCell.identifier, for: indexPath) as? LoanCell else {
            return UITableViewCell()
        }
        
        cell.payment = payments[indexPath.row]
        
        return cell
    }
    
    
}

extension LoansViewController: LoansDisplayLogic {
    func displayPayments(payments:[Payment]){
        self.payments = payments
    }
    
    func displayProcessToPaySuccess() {
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: "Actualizacion de datos", message: "Carga de datos correcta", preferredStyle: .alert)

                // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.router?.routeToLoans()
                }
              

                // Add the actions
                alertController.addAction(okAction)

                // Present the controller
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
}
