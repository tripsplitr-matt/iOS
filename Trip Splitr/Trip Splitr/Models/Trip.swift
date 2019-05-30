//
//  Trip.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation


struct Trip: Codable, Equatable {


    //var id: Int
    var name: String
    var date: String
    var participants: [Participant]?
    var baseCost: Int?
    var img: String?
    var expenses: [Expense]?
    var userId: Int?
    var complete: Bool
}

struct Participant: Codable, Equatable {

    var id: Int
    var users_id: Int
    var trips_id: Int


}
