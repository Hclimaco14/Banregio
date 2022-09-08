//
//  LoanCell.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//

import UIKit

class LoanCell: UITableViewCell {
    
    static let identifier = "LoanCell"
    
    //MARK: Outlets
    @IBOutlet weak var clientLbl: UILabel!
    @IBOutlet weak var termLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var interestLbl: UILabel!
    @IBOutlet weak var ivaLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    

    
    var payment = Payment() {
        didSet{
            configureView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView() {
        clientLbl.text = payment.client
        termLbl.text = String(payment.term)
        amountLbl.text = payment.amount.format()
        interestLbl.text = payment.interest.format()
        ivaLbl.text = payment.iva.format()
        paymentLbl.text = payment.payment.format()
    }
    
}
