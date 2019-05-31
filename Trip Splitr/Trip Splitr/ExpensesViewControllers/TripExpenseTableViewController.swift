//
//  TripExpenseTableViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripExpenseTableViewController: UITableViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        let tabBar = tabBarController as! TripSplitrTabBarViewController
        participantController = tabBar.participantsController
        tripController = tabBar.tripController
        currentTrip = tabBar.currentTrip




        guard let currentTrip = currentTrip,
            let tripController = tripController else { return }

        print(tripController.activeTrips[currentTrip])
        print("\(currentTrip)")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    private func style(cell: UITableViewCell) {
        //        cell.textLabel?.font = AppearanceHelper.typerighterFont(with: .caption1, pointSize: 30)
        
        cell.backgroundColor = AppearanceHelper.lightBlue
    }
    
    private func setupViews() {
        view.backgroundColor = AppearanceHelper.mediumBlue
        tableView.backgroundColor = AppearanceHelper.mediumBlue
        tableView.tableHeaderView?.backgroundColor = AppearanceHelper.mediumBlue
        
    }
    

   

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddEvent" {
            let destinationVC = segue.destination as! TripExpenseEventViewController
//            guard let participantController = participantController else { return }
            destinationVC.participantController = participantController
            destinationVC.tripController = tripController
            destinationVC.currentTrip = currentTrip
        }
    }


 
    var participantController: ParticipantController?
    var tripController: TripController?
    var currentTrip: Int?


}
