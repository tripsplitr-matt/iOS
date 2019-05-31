//
//  PeopleSummaryTableViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class PeopleSummaryTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else {
            return sortExpenses().count
        }    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonSummaryCell", for: indexPath) as! PersonSummaryTableViewCell
            
            guard let participant = participant else { return cell}
            
            cell.nameLabel.text = participant.name
            cell.spentLabel.text = "$\(participant.spent)"
            cell.usedLabel.text = "$\(participant.used)"
            
            apiController.fetchImage(at: participant.img, completion: { result in
                if let image = try? result.get() {
                    DispatchQueue.main.async {
                        cell.personImageView.image = image
                    }
                }
            })
            
            
            style(cell: cell)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonExpenseCell", for: indexPath) as! PersonExpenseTableViewCell
            
            let expenses = sortExpenses()
            let expense = expenses[indexPath.row]
            
            cell.expenseItemNameLabel.text = expense.event
            cell.expenseItemDenominationLabel.text = "\(expense.cost)"
            if expense.usedBy.count == 2 {
                cell.splitExpenseItemWithLabel.text = "\(expense.paidBy.name) split with \(expense.usedBy.count - 1) person"
            } else {
                cell.splitExpenseItemWithLabel.text = "\(expense.paidBy.name) split with \(expense.usedBy.count - 1) people"
            }
            
            
            
            
            
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
    
    
    func sortExpenses() -> [Expense] {
        guard let currentTrip = currentTrip,
            let trip = tripController?.activeTrips[currentTrip],
            let expenses = trip.expenses,
            let participant = participant
            else { return [] }
        var newExpenses: [Expense] = []
        for expense in expenses {
            if expense.usedBy.contains(participant) {
                newExpenses.append(expense)
            }
        }
        return newExpenses
    }
    
    
    var apiController = APIController()
    var participant: Participant?
    var tripController: TripController?
    var currentTrip: Int?
    
}

