//
//  TripExpenseTableViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripExpenseTableViewController: UITableViewController {


    @IBAction func endTripButtonPressed(_ sender: Any) {
        
        guard let currentTrip = currentTrip,
            let trips = tripController?.activeTrips else { return }
        
        var trip = trips[currentTrip]
        trip.complete = true
    }
    
        
        
        
    
    

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
           return 1
        } else {
            guard let currentTrip = currentTrip,
                let tripController = tripController,
                let expenses = tripController.activeTrips[currentTrip].expenses else { return 1}
            return expenses.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsTotalCell", for: indexPath) as! TransactionsTotalTableViewCell
            guard let tripController = tripController,
                let currentTrip = currentTrip
                 else { return cell}
            let trip = tripController.activeTrips[currentTrip]

            guard let total = trip.baseCost else { return cell }

            style(cell: cell)

            cell.tripTotalLabel.text = "$\(total)"


            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpensesCell", for: indexPath) as! TransactionCellTableViewCell
            guard let tripController = tripController,
                let currentTrip = currentTrip,
            let expenses = tripController.activeTrips[currentTrip].expenses else { return cell}
            let usedBy = expenses[indexPath.row].usedBy
            let paidByName = expenses[indexPath.row].paidBy.name
            var usedByString = ""
            if usedBy.count == 2 {
            usedByString = "\(paidByName) split with \(usedBy.count - 1) person"
            } else {
                usedByString = "\(paidByName) split with \(usedBy.count - 1) people"
            }



            cell.transactionNameLabel.text = expenses[indexPath.row].event
            cell.peopleLabel.text = usedByString
            cell.priceLabel.text = "$\(expenses[indexPath.row].cost)"
            cell.priceLabel.textColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
            style(cell: cell)
            return cell

        }

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
