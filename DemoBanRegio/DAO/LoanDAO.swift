//
//  DaoPrestamos.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//

import Foundation


class LoanDAO {
    
    public static let share = LoanDAO()
    static var currentDate =  "15-feb-2021"
    static var interestRate = 7.5
    static  var rateIVA = 16.0
    static var businessYearDays:Double = 360
    
    var loansList: [Loan] = []
    
    var accounts: [DebitAccount] = []
    
    init() {
        var l1 = Loan(client: "00103228", id: "1", date: "10-ene-21", amount: 37500.00, status: .pending)
        var l2 = Loan(client: "00103228", id: "2", date: "19-ene-21", amount: 725.18, status: .pending)
        var l3 = Loan(client: "00103228", id: "3", date: "31-ene-21", amount: 1578.22, status: .pending)
        var l4 = Loan(client: "00103228", id: "4", date: "04-feb-21", amount: 380.00, status: .pending)
        
        var l5 = Loan(client: "70099925", id: "1", date: "07-ene-21", amount: 2175.25, status: .paid)
        var l6 = Loan(client: "70099925", id: "2", date: "13-ene-21", amount: 499.99, status: .paid)
        var l7 = Loan(client: "70099925", id: "3", date: "24-ene-21", amount: 5725.18, status: .pending)
        var l8 = Loan(client: "70099925", id: "4", date: "07-feb-21", amount: 876.13, status: .pending)
        
        var l9 = Loan(client: "00298185", id: "1", date: "04-feb-21", amount: 545.55, status: .pending)
        var l10 = Loan(client: "15000125", id: "1", date: "31-dic-20", amount: 15220.00, status: .paid)
        
        loansList =  [l1,l2,l3,l4,l5,l6,l7,l8,l9,l10]
        
        var d1 = DebitAccount(client: "00103228", amount: 15375.28, status: .active)
        var d2 = DebitAccount(client: "70099925", amount: 3728.51, status: .bloqued)
        var d3 = DebitAccount(client: "00298185", amount: 0, status: .canceled)
        var d4 = DebitAccount(client: "15000125", amount: 235.28, status: .active)
        
        accounts = [d1,d2,d3,d4]
    }
    
    
    class func getBalance(loan: Loan) -> Payment {
        var payment = Payment()
        payment.client = loan.client
        
        if let dateLoan = loan.date.toDate("dd-MMM-yy"), let current = currentDate.toDate("dd-MMM-yy") {
            payment.term = dateLoan.difernceInDays(to: current)
        }
        
        payment.amount = loan.amount
        
        let inters = loan.amount * Double(payment.term) * (interestRate / businessYearDays)
        
        payment.interest = inters
        
        payment.iva = self.rateIVA
        
        payment.payment = loan.amount + inters + rateIVA
        
        return payment
    }
    
    func processPayment(payment: Payment) {
        if let index = accounts.firstIndex(where: { $0.client == payment.client }),
            accounts[index].amount >= payment.amount {
            accounts[index].amount -= payment.amount
            if let indexLoan = loansList.firstIndex(where: { $0.client == payment.client}) {
                loansList[indexLoan].status = .paid
            }
        }
        
    }
    
    
    
}

