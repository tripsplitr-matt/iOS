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
    private func setupViews() {
        
        view.backgroundColor = AppearanceHelper.lightBlue
        addedNameLabel.textColor = AppearanceHelper.darkBlue
        selectPhotoButton.tintColor = AppearanceHelper.darkBlue
        takePhotoButton.tintColor = AppearanceHelper.darkBlue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var addedNameLabel: UILabel!
    @IBOutlet weak var selectPhotoButton: UIButton!
    
}
