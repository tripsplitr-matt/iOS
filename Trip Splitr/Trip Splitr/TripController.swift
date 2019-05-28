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
