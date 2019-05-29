//
//  TripExpensePaidByViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripExpensePaidByViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        view.backgroundColor = AppearanceHelper.lightBlue
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var eventPaidByLabel: UILabel!
    @IBOutlet weak var paidByCollectionView: UICollectionView!
}
