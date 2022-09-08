//
//  DebitAccountPresenter.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

protocol DebitAccountPresentationLogic {
    func presentAccounts(accounts: [DebitAccount])
}

class DebitAccountPresenter: DebitAccountPresentationLogic {
    
    var view: DebitAccountDisplayLogic?
    
    func presentAccounts(accounts: [DebitAccount]) {
        view?.displayAccounts(accounts: accounts)
    }
}
