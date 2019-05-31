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
        guard let text = addImgTextField.text else { return }
        img = text

        print(img)
        self.view.endEditing(true)
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        addPerson()
        navigationController?.popToRootViewController(animated: true)
    }
    func addPerson() {

        guard let name = name,
            let img = addImgTextField.text
            else { return }
       participantController?.createParticipant(name: name, img: img)
        

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
    @IBOutlet weak var addImgTextField: UITextField!
    @IBOutlet weak var addedNameLabel: UILabel!

    var img: String = ""
    var name: String?
    var participantController: ParticipantController?

}
