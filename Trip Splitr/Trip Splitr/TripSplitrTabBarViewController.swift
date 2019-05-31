//
//  TripSplitrTabBarViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/30/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripSplitrTabBarViewController: UITabBarController {


    var participantsController = ParticipantController()

    var tripController = TripController()

    var currentTrip: Int = 0
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
