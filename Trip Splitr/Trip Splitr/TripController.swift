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
        let newTrip = Trip(name: name, date: date, participants: [], baseCost: 0, img: img, expenses: [], paidBy: "",  complete: false)
        activeTrips.append(newTrip)
    }
    
    func createExpense(event: String, cost: Int, paidBy: Participant, usedBy: [Participant], currentTrip: Int) {
        
        let newExpense = Expense(event: event, cost: cost, paidBy: paidBy, usedBy: usedBy)
        activeTrips[currentTrip].expenses?.append(newExpense)
        
        updateBaseCost(expense: newExpense, currentTrip: currentTrip)
        updateParticipantSpent(paidBy: paidBy, currentTrip: currentTrip, expense: newExpense)
        updateParticipantUsed(usedBy: usedBy, currentTrip: currentTrip, expense: newExpense)
    }
    
    func updateBaseCost(expense: Expense, currentTrip: Int) {
        guard let baseCost = activeTrips[currentTrip].baseCost else { return }
        let newBaseCost = baseCost + expense.cost
        activeTrips[currentTrip].baseCost = newBaseCost
    }
    
    func updateParticipantUsed(usedBy: [Participant], currentTrip: Int, expense: Expense) {
        
        let cost = expense.cost
        let count = usedBy.count
        
        
        

                for indexPath in 0..<(count) {
                    let used = ( cost / count )
                    let participant = usedBy[indexPath]
                    print(participant)
                    print(used)

                    let personIndex = activeTrips[currentTrip].participants?.firstIndex(of: participant)

                    activeTrips[currentTrip].participants?[personIndex ?? 0].used += used

                }

    }
    
    func createParticipant(name: String, img: String, currentTrip: Int) {
        
        let participant = Participant(name: name, img: img, spent: 0, used: 0)
        activeTrips[currentTrip].participants?.append(participant)
    }
    
    func updateParticipantSpent(paidBy: Participant, currentTrip: Int, expense: Expense){

        let personIndex = activeTrips[currentTrip].participants?.firstIndex(of: paidBy)
        activeTrips[currentTrip].participants?[personIndex ?? 0].spent += expense.cost

    }
    
    func toggleComplete(trip: Trip) {

        guard let indexPath = activeTrips.firstIndex(of: trip) else { return }
        activeTrips[indexPath].complete = true
        filterActiveTrips()
    }

    func filterActiveTrips() {
        for trip in activeTrips {
            if trip.complete == true {
                guard let indexPath = activeTrips.firstIndex(of: trip) else { return }
                pastTrips.append(trip)
                activeTrips.remove(at: indexPath)
            }
        }
    }
    
    
    var allTrips: [Trip] = [Trip(name: "Germany", date: "10/16/18", participants: [], baseCost: 0, img: "https://www.topuniversities.com/sites/default/files/articles/lead-images/germany-view.jpg", expenses: [], paidBy: "", complete: false),Trip(name: "Iceland", date: "5/1/19", participants: [Participant(name: "Someone", img: "https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg", spent: 0, used: 0),Participant(name: "Jon", img: "https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg", spent: 0, used: 0), Participant(name: "Ryan", img: "https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg", spent: 0, used: 0)], baseCost: 0, img: "https://www.telegraph.co.uk/content/dam/Travel/2019/March/Kirkjufell-iStock-959966730.jpg?imwidth=1400", expenses: [], paidBy: "", complete: false)]
    
    var activeTrips: [Trip] = []
   var pastTrips: [Trip] = []

    init() {
        activeTrips = liveTrips
        pastTrips = deadTrips
    }
    
    var liveTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.complete == false {
                trips.append(trip)
            }
        }
        return trips
    }
    
    
    
    var deadTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.complete == true {
                trips.append(trip)
            }
        }
        return trips
    }
    
}
