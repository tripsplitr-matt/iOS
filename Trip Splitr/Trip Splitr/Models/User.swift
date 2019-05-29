//
//  User.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation



struct User: Codable, Equatable {
    var id: Int
    var name: String
    var userName: String
    var password: String
//     var spent: Int?
//     var recieved: Int?
    var avatar: String
    
}
