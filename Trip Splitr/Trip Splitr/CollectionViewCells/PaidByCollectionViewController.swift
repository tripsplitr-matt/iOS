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


        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.allowsMultipleSelection = false


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        guard let participantController = participantController else { return 1}
        return participantController.allParticipants.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaidBy", for: indexPath) as! PaidByCollectionViewCell
        guard let particapantController = participantController else { return cell}
        let participant = particapantController.allParticipants[indexPath.item]
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

        let participant = participantController?.allParticipants[indexPath.item]

        let cell = collectionView.cellForItem(at: indexPath) as! PaidByCollectionViewCell
        cell.paidLabel.isHidden = !cell.paidLabel.isHidden
        }


    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {


        let cell = collectionView.cellForItem(at: indexPath) as! PaidByCollectionViewCell
        cell.paidLabel.isHidden = !cell.paidLabel.isHidden
    }


    


    var participantController: ParticipantController?
    var tripController: TripController?
    var event: String?
    var cost: Int?
    var apiController = APIController()
    var currentTrip: Int?

}
