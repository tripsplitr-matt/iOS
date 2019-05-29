//
//  Trip.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation


struct Trip: Codable, Equatable {
    var id: Int
    var name: String
    var date: String
    var users: [User]?
    var cost: Int?
//    var image: String
    var creatorID: Int
    var past: Bool
 
    
}
