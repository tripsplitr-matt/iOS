//
//  TripController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class TripController {



    func createTrip(name: String, date: String) {
        let newId = Int.random(in: 1...100)
        let newTrip = Trip(id: newId, name: name, date: "\(date)", users: [User( name: "Imma", username: "Getting", password: "Drunk")], cost: 0, expenses: [] ,creatorID: newId, past: false)




        allTrips.append(newTrip)

    }

    var allTrips: [Trip] = []





    var activeTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.past == false {
                trips.append(trip)
            }
        }
        return trips
    }
    var pastTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.past == true {
                trips.append(trip)
            }
        }
        return trips
    }

}
