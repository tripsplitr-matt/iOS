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
            let destinationVC = segue.destination as? TripExpensePaidByViewController
            destinationVC?.cost = cost
            destinationVC?.event = event


        }

    }

    var cost: Int = 0
    var event: String?
    @IBOutlet weak var tripCostTextField: UITextField!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var enterCostLabel: UILabel!
}
