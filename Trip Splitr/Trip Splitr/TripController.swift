//
//  TripController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class TripController {

    
    
    func createTrip(name: String, date: Date) {
        
        let newId = Int.random(in: 1...100)
        
        let newTrip = Trip(id: newId, name: name, date: "\(date)", users: [User(id: 56, name: "Imma", userName: "Getting", password: "Drunk", avatar: "Tonight")], cost: 0, creatorID: newId, past: false)
    
        
        
        
        allTrips.append(newTrip)
    
    }
    
    var allTrips: [Trip] = [Trip(id: 1, name: "Bora", date: "2021-07-01 00:26:50 +0000", users: [User(id: 2, name: "Ryan", userName: "TfMuasdf", password: "YourMom", avatar: "balls")], cost: 5000, creatorID: 2, past: false), Trip(id: 3, name: "Tom", date: "2021-07-01 00:26:50 +0000", users: [User(id: 4, name: "Mike", userName: "Ding", password: "AlsoYourMom", avatar: "aaa"),User(id: 11, name: "Jon", userName: "asd", password: "asdfas", avatar: "asdf")], cost: 10000, creatorID: 6, past: true), Trip(id: 20, name: "Steve", date: "2021-07-01 00:26:50 +0000", users: [User(id: 56, name: "Imma", userName: "Getting", password: "Drunk", avatar: "Tonight")], cost: 70000, creatorID: 45, past: false)]

    
    
    
    
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
