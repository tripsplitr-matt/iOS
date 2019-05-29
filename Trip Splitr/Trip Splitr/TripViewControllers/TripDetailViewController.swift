//
//  TripDetailViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        tripController?.createTrip(name: tripNameTextField.text!, date: datePicker.date)
        print(datePicker.date)
        self.dismiss(animated: true)
    
    }
    
    @IBOutlet weak var tripImageTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tripNameTextField: UITextField!
    var tripController: TripController?
    var trip: Trip?
    
    
}
