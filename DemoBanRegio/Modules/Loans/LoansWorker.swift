//
//  LoansWorker.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

class LoansWorker {
    
    func getPaymenst() -> [Payment] {
        var payments: [Payment] = []
        
        for loan in LoanDAO.share.loansList {
            let pay = LoanDAO.getBalance(loan: loan)
            payments.append(pay)
        }
        
        return payments
        
    }
    
    func processToPay(payments: [Payment]) {
        for pay in payments {
            LoanDAO.share.processPayment(payment: pay)
        }
    }
    
}
