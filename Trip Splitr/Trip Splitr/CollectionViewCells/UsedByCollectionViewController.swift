//
//  UsedByCollectionViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/30/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class UsedByCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVeiws()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }



    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "UsedByHeader", for: indexPath) as! UsedByCollectionReusableView

        guard let cost = cost,
            let event = event,
            let paidBy = paidBy else { return headerView }

        headerView.eventLabel.text = event
        headerView.costLabel.text = "$\(cost)"
        headerView.paidByLabel.text = paidBy.name

        return headerView

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        usedByString = ""
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let tripController = tripController,
            let currentTrip = currentTrip,
            let participants = tripController.activeTrips[currentTrip].participants else { return 1}
        return participants.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsedBy", for: indexPath) as! UsedByCollectionViewCell
        guard let tripController = tripController,
            let currentTrip = currentTrip,
            let participants = tripController.activeTrips[currentTrip].participants else { return cell}
        let participant = participants[indexPath.item]

        cell.nameLabel.text = participant.name

        apiController.fetchImage(at: participant.img, completion: { result in
            if let image = try? result.get() {
                DispatchQueue.main.async {
                    cell.usedByImageView.image = image
                }
            }
        })

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let tripController = tripController,
            let currentTrip = currentTrip,
            let participants = tripController.activeTrips[currentTrip].participants else { return }

        let participant = participants[indexPath.item]
        
        let cell = collectionView.cellForItem(at: indexPath) as! UsedByCollectionViewCell
        cell.usedLabel.isHidden = !cell.usedLabel.isHidden



        if usedBy.contains(participant) {
            guard let usedByIndex = usedBy.firstIndex(of: participant) else { return }
            usedBy.remove(at: usedByIndex)
        } else {
            usedBy.append(participant) }
        print(usedBy)
    }

//    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        guard let tripController = tripController,
//            let currentTrip = currentTrip,
//            let participants = tripController.activeTrips[currentTrip].participants else { return }
//
//        let participant = participants[indexPath.item]
//
//        guard let removeIndex = usedBy.firstIndex(of: participant) else { return }
//
//        usedBy.remove(at: removeIndex)
//
//
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConfirmExpense" {
            let destinationVC = segue.destination as? ConfirmExpenseViewController
            destinationVC?.cost = cost
            destinationVC?.event = event
            destinationVC?.participantController = participantController
            destinationVC?.tripController = tripController
            destinationVC?.currentTrip = currentTrip
            destinationVC?.paidBy = paidBy
            destinationVC?.usedBy = usedBy

            print(usedBy)
            print(usedByString)
            convertArray()
            destinationVC?.usedByString = usedByString

        }
    }


    func convertArray() {
        for participant in usedBy {
            let name = participant.name
            usedByString.append("\(name) ")
        }
    }



    func setupVeiws() {
        collectionView.backgroundColor = AppearanceHelper.mediumBlue

    }
    var usedByString: String = ""
    var usedBy: [Participant] = []
    var paidBy: Participant?
    var participantController: ParticipantController?
    var tripController: TripController?
    var event: String?
    var cost: Int?
    var apiController = APIController()
    var currentTrip: Int?

}
