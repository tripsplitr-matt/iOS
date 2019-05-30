//
//  PersonListTableViewCell.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class PersonListTableViewCell: UITableViewCell {

    @IBAction func personSummaryButtonPressed(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupViews() {
        personNameLabel.textColor = AppearanceHelper.darkBlue
        
        
    }

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIView!
   
}
