//
//  ConfirmExpenseViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/31/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class ConfirmExpenseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        setUpViews()
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
    }

    func setUpViews() {
        guard let paidBy = paidBy,
            let participantController = participantController,
            let tripController = tripController,
            let event = event,
            let cost = cost,
            let currentTrip = currentTrip else { return }
        
        usedByLabel.text = usedByString

        paidByLabel.text = paidBy.name
        costLabel.text = "$\(cost)"
        eventLabel.text = event

       

    }

    
    @IBOutlet weak var usedByLabel: UILabel!
    @IBOutlet weak var paidByLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    var usedByString = ""
    var usedBy: [Participant] = []
    var paidBy: Participant?
    var participantController: ParticipantController?
    var tripController: TripController?
    var event: String?
    var cost: Int?
    var currentTrip: Int?


}
