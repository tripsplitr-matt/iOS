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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    var participantController: ParticipantController?
    var event: String?
    var cost: Int?
    var apiController = APIController()

}
