//
//  Expense.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/30/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

struct Expense: Codable, Equatable {

    let event: String
    let cost: Int
    let paidBy: [User]
    let usedBy: [User]


}
