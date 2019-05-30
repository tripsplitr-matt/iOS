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
        updateViews()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateTrip()
    }

    private func updateViews() {
        view.backgroundColor = AppearanceHelper.lightBlue
        tripNameTextField.backgroundColor = AppearanceHelper.lightGray
        tripImageTextField.backgroundColor = AppearanceHelper.lightGray
    }


    func updateTrip() {
        guard let trip = trip else { return }
        tripNameTextField.text = trip.name
        tripImageTextField.text = trip.img

        //        let isoDate = trip.date
        //        let dateFormatter = ISO8601DateFormatter()
        //        let date = dateFormatter.date(from:isoDate)!
        //
        //        datePicker.date = date

    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = tripNameTextField.text,
            !name.isEmpty, let img = tripImageTextField.text,
            !img.isEmpty
            else { return }

        if let _ = trip {
            self.trip!.name = name
            self.trip!.img = img
            self.dismiss(animated: true)

        } else {

        tripController?.createTrip(name: tripNameTextField.text ?? "", date: "\(datePicker.date)", img: tripImageTextField.text ?? "")

        self.dismiss(animated: true)
    }
    }

    @IBOutlet weak var tripImageTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tripNameTextField: UITextField!
    var tripController: TripController?
    var trip: Trip?


}
