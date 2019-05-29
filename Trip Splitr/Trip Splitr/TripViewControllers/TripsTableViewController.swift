//
//  TripsTableViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
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
            return tripController.activeTrips.count
        } else {
            return tripController.pastTrips.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveTripCell", for: indexPath) as! ActiveTripTableViewCell
            let trip = tripController.activeTrips[indexPath.row]

            if trip.past == false {
                cell.tripNameLabel.text = trip.name
                cell.numberOfPeopleLabel.text = "\(trip.users!.count) people"
                cell.dateLabel.text = trip.date
                cell.costLabel.text = "\(trip.cost ?? 0)"

            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastTripCell", for: indexPath) as! PastTripTableViewCell
            let trip = tripController.pastTrips[indexPath.row]

            if trip.past == true {
                cell.dateLabel.text = trip.date
                cell.tripNameLabel.text = trip.name
            }
            return cell

        }

    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if self.tableView(tableView, numberOfRowsInSection: section) > 0 {
            switch section {
            case 0:
                return "Active Trips"
            case 1:
                return "Past Trips"
            default:
                return nil
            }
        }

        return nil
    }





    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTrip" {
            let destinationVC = segue.destination as? TripDetailViewController
            destinationVC?.tripController = tripController
        } else if segue.identifier == "EditTrip" {
            let destinationVC = segue.destination as? TripDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationVC?.tripController = tripController
            destinationVC?.trip = tripController.activeTrips[indexPath.row]
 
        }
        

    }


    var tripController = TripController()

}
