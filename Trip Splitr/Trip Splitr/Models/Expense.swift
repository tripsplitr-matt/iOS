//
//  Expense.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/30/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

struct Expense: Codable, Equatable {

    var event: String
    var cost: Int
    var paidBy: [Participant]
    var usedBy: [Participant]
}
