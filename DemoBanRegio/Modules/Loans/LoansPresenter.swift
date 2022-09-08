//
//  LoansPresenter.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

protocol LoansPresentationLogic {
    func presentPayments(payments:[Payment])
    func prensetProcessToPaySuccess()
}

class LoansPresenter: LoansPresentationLogic {
    
    var view: LoansDisplayLogic?
    
    func presentPayments(payments:[Payment]) {
        view?.displayPayments(payments: payments)
    }
    
    func prensetProcessToPaySuccess() {
        view?.displayProcessToPaySuccess()
    }
}
