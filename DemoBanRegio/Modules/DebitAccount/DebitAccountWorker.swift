//
//  DebitAccountWorker.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

class DebitAccountWorker {
    
    func getAccounts() -> [DebitAccount] {
        
        return LoanDAO.share.accounts
    }
    
}
