//
//  Trip.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation


struct Trip: Codable, Equatable {

    enum CodingKeys: String, CodingKey {
        //case id
        case name
        case date
        case users = "participants"
        case cost = "base_cost"
        case expenses
        case creatorID = "user_id"
        case past = "complete"
    }

    //var id: Int
    var name: String
    var date: String
    var users: [User]?
    var cost: Int?
    var img: String?
    var expenses: [Expense]?
    var creatorID: Int
    var past: Bool
 
    
}
