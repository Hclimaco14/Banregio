//
//  DebitAccountInteractor.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//


import Foundation


protocol DebitAccountBusinessLogic {
    func getAccounts()
}

class DebitAccountInteractor:  DebitAccountBusinessLogic {
    
    var presenter: DebitAccountPresentationLogic?
    
    let worker = DebitAccountWorker()
    
    func getAccounts() {
        presenter?.presentAccounts(accounts: worker.getAccounts())
    }
    
}
