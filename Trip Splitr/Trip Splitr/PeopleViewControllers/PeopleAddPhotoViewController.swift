//
//  PeopleAddPhotoViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class PeopleAddPhotoViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        guard let img = addImgTextField.text,
            let name = name,
            let currentTrip = currentTrip else { return }

        
        print(img)
        self.view.endEditing(true)
        tripController?.createParticipant(name: name, img: img, currentTrip: currentTrip )
        addImgTextField.text = ""
        navigationController?.popToRootViewController(animated: true)

    }





    private func setupViews() {
        
        view.backgroundColor = AppearanceHelper.lightBlue
        addedNameLabel.textColor = AppearanceHelper.darkBlue

        addedNameLabel.text = name
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var addImgTextField: UITextField!
    @IBOutlet weak var addedNameLabel: UILabel!

    var img: String = ""
    var name: String?
    var participantController: ParticipantController?
    var currentTrip: Int?
    var tripController: TripController?

}
