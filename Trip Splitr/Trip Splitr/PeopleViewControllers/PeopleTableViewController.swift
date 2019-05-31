//
//  PeopleTableViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit



class PeopleTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        apiController.getUsers { (result) in
//
//            do {
//                self.people = try result.get()
//
//                DispatchQueue.main.async {
//
//                    self.tableView.reloadData()
//                    print(self.people)
//                }
//
//            } catch {
//                NSLog("Error getting all trips")
//            }
//
//
//        }
//
     tableView.reloadData()

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()



    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return participantController.allParticipants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonListTableViewCell
        let person = participantController.allParticipants[indexPath.row]
        cell.personNameLabel.text = person.name
        style(cell: cell)

        return cell
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
        if segue.identifier == "PeopleSummary" {
            let destinationVC = segue.destination as! PeopleSummaryTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationVC.participant = participantController.allParticipants[indexPath.row]
        } else if segue.identifier == "AddPeople" {
            let destinationVC = segue.destination as! PeopleAddNameViewController
            destinationVC.participantController = participantController
        }

    }

    var participantController = ParticipantController()
    var apiController = APIController()
    var people: [User] = [] {
        didSet {

            DispatchQueue.main.async {
                  self.tableView.reloadData()
          
            }
        }
    }


}
