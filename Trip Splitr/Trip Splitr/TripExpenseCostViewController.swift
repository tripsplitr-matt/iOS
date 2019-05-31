//
//  TripExpenseCostViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripExpenseCostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        guard let currentTrip = currentTrip,
            let tripController = tripController else { return }
        print("in addcost currentTrip \(currentTrip)")
        print(tripController.activeTrips[currentTrip])


        // Do any additional setup after loading the view.
    }
    private func setupViews() {
        view.backgroundColor = AppearanceHelper.lightBlue
        eventLabel.text = event
        
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let text = tripCostTextField.text else { return }
        cost = Int(text) ?? 0
        self.view.endEditing(true)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPaidBy" {
            let destinationVC = segue.destination as? PaidByCollectionViewController
            destinationVC?.cost = cost
            destinationVC?.event = event
            destinationVC?.participantController = participantController
            destinationVC?.tripController = tripController
            destinationVC?.currentTrip = currentTrip


        }

    }

    var cost: Int = 0
    var event: String?
    var participantController: ParticipantController?
    var tripController: TripController?
    var currentTrip: Int?
    @IBOutlet weak var tripCostTextField: UITextField!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var enterCostLabel: UILabel!
}
