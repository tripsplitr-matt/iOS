//
//  TripExpenseEventViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripExpenseEventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    private func setupViews() {
        view.backgroundColor = AppearanceHelper.lightBlue
    
    }

    @IBAction func costButtonPressed(_ sender: Any) {

    }

    @IBAction func addButtonPressed(_ sender: Any) {

        guard let text = tripEventTextField.text else { return }
        event = text
        self.view.endEditing(true)

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "AddCost" {
            let destinationVC = segue.destination as? TripExpenseCostViewController
            destinationVC?.event = event
        }
    }

    var event: String = "..."
    @IBOutlet weak var tripEventTextField: UITextField!
    @IBOutlet weak var enterTripEventLabel: UILabel!
}
