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

        guard let participantController = participantController else { return }
        print("\(participantController.allParticipants)")
        participantController.createParticipant(name: "Jon", img: "image")

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
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddEvent" {
            let destinationVC = segue.destination as! TripExpenseEventViewController
//            guard let participantController = participantController else { return }
            destinationVC.participantController = participantController
        }
    }


 
    var participantController: ParticipantController?

}
