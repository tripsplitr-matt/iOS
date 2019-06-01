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

    

    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = tripNameTextField.text,
            !name.isEmpty, let img = tripImageTextField.text,
            !img.isEmpty,
            let tripController = tripController
            else { return }

        if let _ = trip {
            self.trip!.name = name
            self.trip!.img = img
            
            self.dismiss(animated: true)

        } else {

            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = DateFormatter.Style.short
            let strDate = dateFormatter.string(from: datePicker.date)
            
            tripController.createTrip(name: tripNameTextField.text ?? "", date: strDate, img: tripImageTextField.text ?? "")

        self.dismiss(animated: true)
    }
    }
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        
//        let dateFormatter = DateFormatter()
//        
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        let strDate = dateFormatter.string(from: datePicker.date)
    }
    
    

    @IBOutlet weak var tripImageTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tripNameTextField: UITextField!
    var tripController: TripController?
    var trip: Trip?
    var apiController = APIController()

    
   

}
