//
//  DebitCell.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//

import UIKit

class DebitCell: UITableViewCell {
    public static let identifier = "DebitCell"

    
    //MARK: Outlets
    @IBOutlet weak var clientLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    
    var account: DebitAccount = DebitAccount() {
        didSet {
            self.configureView()
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
    
    func configureView(){
        print(account.client)
        clientLbl.text = account.client
        amountLbl.text = account.amount.format()
        statusLbl.text = account.status.rawValue
    }
    
}
