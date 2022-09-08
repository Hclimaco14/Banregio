//
//  LoansRouter.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//


import UIKit

protocol LoansRoutingLogic {
    func routeToLoans()
}

class LoansRouter: LoansRoutingLogic {
    
    var view: LoansViewController?
    
    func routeToLoans() {
        view?.navigationController?.popViewController(animated: true)
    }
    
}
