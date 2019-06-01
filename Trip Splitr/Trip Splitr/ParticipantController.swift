//
//  ParticipentController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/30/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class ParticipantController {

    var allParticipants: [Participant] = [Participant(name: "Jon", img: "https://www.belightsoft.com/products/imagetricks/img/core-image-filters@2x.jpg", spent: 0, used: 0), Participant(name: "Ryan", img: "https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg", spent: 0, used: 0)]

    func createParticipant(name: String, img: String) {

        let participant = Participant(name: name, img: img, spent: 0, used: 0)
        allParticipants.append(participant)
        print("created trip")
        print(allParticipants)

    }


}
