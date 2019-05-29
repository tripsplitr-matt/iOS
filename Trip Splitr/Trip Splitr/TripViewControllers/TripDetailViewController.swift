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

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateTrip()
    }

    func updateTrip() {
        guard let trip = trip else { return }
        tripNameTextField.text = trip.name

//        let isoDate = trip.date
//        let dateFormatter = ISO8601DateFormatter()
//        let date = dateFormatter.date(from:isoDate)!
//
//        datePicker.date = date

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
