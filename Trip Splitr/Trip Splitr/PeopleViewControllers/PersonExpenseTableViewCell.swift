//
//  PersonExpenseTableViewCell.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class PersonExpenseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var expenseItemNameLabel: UILabel!
    @IBOutlet weak var splitExpenseItemWithLabel: UILabel!
    @IBOutlet weak var expenseItemDenominationLabel: UILabel!
    
}
