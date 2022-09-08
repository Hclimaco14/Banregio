//
//  LoansInteractor.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//


import Foundation


protocol LoansBusinessLogic {
    func getLoans()
    func processToPay(payments: [Payment])
}

class LoansInteractor:  LoansBusinessLogic {
    
    var presenter: LoansPresentationLogic?
    
    let worker = LoansWorker()
    
    func getLoans() {
        presenter?.presentPayments(payments: worker.getPaymenst())
    }
    
    
    func processToPay(payments: [Payment]) {
        worker.processToPay(payments: payments)
        presenter?.prensetProcessToPaySuccess()
    }
    
}
