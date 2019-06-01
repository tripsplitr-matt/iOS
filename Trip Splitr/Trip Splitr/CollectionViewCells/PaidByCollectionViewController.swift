//
//  PaidByCollectionViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/30/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PaidByCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVeiws()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.allowsMultipleSelection = false



    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PaidByHeader", for: indexPath) as! PaidByCollectionReusableView

        guard let cost = cost,
            let event = event else { return headerView }

        headerView.eventLabel.text = event
        headerView.costLabel.text = "$\(cost)"

        return headerView

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let tripController = tripController,
            let currentTrip = currentTrip,
            let participants = tripController.activeTrips[currentTrip].participants else { return 1}
        return participants.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaidBy", for: indexPath) as! PaidByCollectionViewCell
        guard let tripController = tripController,
            let currentTrip = currentTrip,
            let participants = tripController.activeTrips[currentTrip].participants else { return cell}
        let participant = participants[indexPath.item]
        cell.nameLabel.text = participant.name

        apiController.fetchImage(at: participant.img, completion: { result in
            if let image = try? result.get() {
                DispatchQueue.main.async {
                    cell.collectionImageView.image = image
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
        paidBy = participant
        let cell = collectionView.cellForItem(at: indexPath) as! PaidByCollectionViewCell
        print(indexPath)
        cell.paidLabel.isHidden = !cell.paidLabel.isHidden
        print(participant.name)
    }


    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {


        let cell = collectionView.cellForItem(at: indexPath) as! PaidByCollectionViewCell
        cell.paidLabel.isHidden = !cell.paidLabel.isHidden
    }

    func setupVeiws() {
        collectionView.backgroundColor = AppearanceHelper.lightBlue

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddUsedBy" {
            let destinationVC = segue.destination as? UsedByCollectionViewController
            destinationVC?.cost = cost
            destinationVC?.event = event
            destinationVC?.participantController = participantController
            destinationVC?.tripController = tripController
            destinationVC?.currentTrip = currentTrip
            destinationVC?.paidBy = paidBy

        }
    }





    var paidBy: Participant?
    var participantController: ParticipantController?
    var tripController: TripController?
    var event: String?
    var cost: Int?
    var apiController = APIController()
    var currentTrip: Int?

}
