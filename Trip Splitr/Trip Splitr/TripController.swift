//
//  TripController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class TripController {

    func createTrip(name: String, date: String, img: String) {

        let newTrip = Trip(name: name, date: date, participants: [], baseCost: 0, img: img, expenses: [], userId: 1, complete: false)

        allTrips.append(newTrip)

    }

    

    var allTrips: [Trip] = [Trip(name: "Germany", date: "10/16/18", participants: [], baseCost: 345, img: "https://www.topuniversities.com/sites/default/files/articles/lead-images/germany-view.jpg", expenses: [], userId: 1, complete: true),Trip(name: "Iceland", date: "5/1/19", participants: [], baseCost: 1200, img: "https://www.telegraph.co.uk/content/dam/Travel/2019/March/Kirkjufell-iStock-959966730.jpg?imwidth=1400", expenses: [], userId: 1, complete: true)]

    var activeTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.complete == false {
                trips.append(trip)
            }
        }
        return trips
    }
    var pastTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.complete == true {
                trips.append(trip)
            }
        }
        return trips
    }

}
