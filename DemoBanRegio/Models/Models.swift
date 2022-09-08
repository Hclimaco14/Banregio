//
//  Models.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//

import Foundation

struct Payment {
    var client: String = ""
    var term: Int = 0
    var amount: Double = 0
    var interest: Double = 0
    var iva: Double = 0
    var payment: Double = 0
}

struct DebitAccount {
    var client: String = ""
    var amount: Double = 0
    var status: StatusAccount = .active
}

enum StatusAccount: String{
    case active = "Activa"
    case bloqued = "Bloqueada"
    case canceled = "Cancelada"
}

struct Loan {
    var client:String = ""
    var id: String = ""
    var date: String = ""
    var amount: Double = 0
    var status: StatusLoan = .pending
}


enum StatusLoan: String {
    case pending = "Pendiente"
    case paid = "Pagado"
}
