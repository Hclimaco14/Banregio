//
//  DebitAccountRouter.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//


import UIKit

protocol DebitAccountRoutingLogic {
    func routeToLoans()
}

class DebitAccountRouter: DebitAccountRoutingLogic {
    
    var view: DebitAccountViewController?
    
    func routeToLoans() {
        let vc = LoansViewController()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
