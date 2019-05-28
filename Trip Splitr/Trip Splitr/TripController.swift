//
//  TripController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class TripController {

    var allTrips: [Trip] = []
    var activeTrips: [Trip] = []
    var pastTrips: [Trip] = []

    func sortTrips() {

        for trip in allTrips {
            if trip.past == true {
                pastTrips.append(trip)
            } else {
                activeTrips.append(trip)
            }
        }
    }

    init() {
        sortTrips()
    }




}
