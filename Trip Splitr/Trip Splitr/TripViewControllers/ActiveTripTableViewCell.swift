//
//  ActiveTripTableViewCell.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class ActiveTripTableViewCell: UITableViewCell {


    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }

    @IBOutlet weak var editTripButton: UIButton!
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var endTripButton: UIButton!
    var tripController: TripController?

    func setupView() {
//    endTripButton.backgroundColor = AppearanceHelper.mediumBlue
//    endTripButton.tintColor = AppearanceHelper.darkBlue
//   
        
        
        
    }
    
    
}
