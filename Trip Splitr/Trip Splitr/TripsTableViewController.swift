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

        let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveTripCell", for: indexPath) as! ActiveTripTableViewCell


        return cell
    }




    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


    var tripController = TripController()

}
