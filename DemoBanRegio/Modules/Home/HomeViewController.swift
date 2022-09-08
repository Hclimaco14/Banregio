//
//  HomeViewController.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

protocol HomeDisplayLogic {
    func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    
    // MARK: - Variables
    
    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?
    
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
    }
    
    // MARK: - Configurators
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = HomeInteractor()
        let presenter       = HomePresenter()
        let router          = HomeRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    // MARK: - Private
    
    
    // MARK: - Actions
    
    
}

extension HomeViewController: HomeDisplayLogic {
    func displaySomething(viewModel: Home.Something.ViewModel) {}
}
