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

            if apiController.bearer == nil {
                performSegue(withIdentifier: "LoginViewModalSegue", sender: self)
        }


        tableView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        let tabBar = tabBarController as! TripSplitrTabBarViewController
        guard let currentTrip = currentTrip else { return }
        tabBar.currentTrip = currentTrip
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        apiController.getTrips { (result) in
            do {
                self.tripNames = try result.get()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print(self.tripNames)
                }
            } catch {
                NSLog("Error getting all trips")
            }
        }


        let tabBar = tabBarController as! TripSplitrTabBarViewController
        tripController = tabBar.tripController
        currentTrip = tabBar.currentTrip
        guard let currentTrip = currentTrip,
            let tripController = tripController
            else { return }
        print(currentTrip)
        setupAppearances()
        tableView.reloadData()

        if tripController.activeTrips.count > 0 {
            tabBar.tabBar.isHidden = false
        }
        self.currentTrip = 0

    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
        let cell = tableView.cellForRow(at: indexPath) as! ActiveTripTableViewCell
        cell.editTripButton.isHidden = !cell.editTripButton.isHidden
        //cell.endTripButton.isHidden = !cell.endTripButton.isHidden
        currentTrip = indexPath.row
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at: indexPath) as! ActiveTripTableViewCell
            cell.editTripButton.isHidden = !cell.editTripButton.isHidden
//            cell.endTripButton.isHidden = !cell.endTripButton.isHidden
        }
    }

    // MARK: - Table view data source

    @IBAction func endTripButtonPressed(_ sender: Any) {

        guard let currentTrip = currentTrip,
            let trips = tripController?.activeTrips else { return }

        let trip = trips[currentTrip]

        tripController?.toggleComplete(trip: trip)

        let tabBar = tabBarController as! TripSplitrTabBarViewController

        self.currentTrip = 0

        tableView.reloadData()

        if tripController?.activeTrips.count == 0 {
            tabBar.tabBar.isHidden = true
        }



    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            guard let tripController = tripController else { return 1 }
            return tripController.activeTrips.count
        }
        if section == 1 {
            guard let tripController = tripController else { return  1}
            return tripController.pastTrips.count
        }
        return 1
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveTripCell", for: indexPath) as! ActiveTripTableViewCell
            guard let tripController = tripController else { return cell}
             let trip = tripController.activeTrips[indexPath.row]
            guard let img = trip.img else { return cell }


            if trip.complete == false {
                cell.tripNameLabel.text = trip.name
                cell.numberOfPeopleLabel.text = "\(trip.participants!.count) people"
                cell.dateLabel.text = trip.date
                cell.costLabel.text = "$\(trip.baseCost ?? 0)"

                apiController.fetchImage(at: img, completion: { result in
                    if let image = try? result.get() {
                        DispatchQueue.main.async {
                            cell.tripImageView.image = image
                            
                        }
                    }
                })

                style(cell: cell)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastTripCell", for: indexPath) as! PastTripTableViewCell
            guard let tripController = tripController else { return cell}
            let trip = tripController.pastTrips[indexPath.row]
            guard let img = trip.img else { return cell }
            if trip.complete == true {
                cell.dateLabel.text = trip.date
                cell.tripNameLabel.text = trip.name

                apiController.fetchImage(at: img, completion: { result in
                    if let image = try? result.get() {
                        DispatchQueue.main.async {
                            cell.tripImageView.image = image
                        }
                    }
                })

                style(cell: cell)
            }
            return cell

        }

    }

    private func style(cell: UITableViewCell) {
        //        cell.textLabel?.font = AppearanceHelper.typerighterFont(with: .caption1, pointSize: 30)

        cell.backgroundColor = AppearanceHelper.lightBlue
    }

    private func setupAppearances() {
        view.backgroundColor = AppearanceHelper.mediumBlue
        tableView.backgroundColor = AppearanceHelper.mediumBlue
        tableView.tableHeaderView?.backgroundColor = AppearanceHelper.mediumBlue

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
            guard let tripController = tripController else { return }
            destinationVC?.trip = tripController.activeTrips[indexPath.row]
        } else if segue.identifier == "LoginViewModalSegue" {
            let destinationVC = segue.destination as? LoginViewController
            destinationVC?.apiController = apiController
        }


    }

//    func sortTrips() {
//
//        let tripCount = tripNames.count
//
//        for tripID in 1...tripCount {
//            var trip: Trip?
//            apiController.getTrip(tripID: tripID) { (result) in
//                do {
//                    trip = try result.get()
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                        print(trip!)
//                    }
//                } catch {
//                    NSLog("Error getting all trips")
//                }
//            }
//
//
//
//        }
//
//
//    }

    var currentTrip: Int?
    var tripController: TripController?
    var apiController = APIController()
    var tripNames: [TripName] = [] 

}
