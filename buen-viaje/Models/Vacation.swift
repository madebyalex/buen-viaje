//
//  Vacation.swift
//  buen-viaje
//
//  Created by Alexander on 17.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import Foundation

struct Vacation {
    
    let price: Int
    let description: String
    let title: String
    let images: [String]
    let activities: String
    let airfare: String
    let numberOfNights: Int
    
    init(
        price: Int,
        description: String,
        title: String,
        images: [String],
        activities: String,
        airfare: String,
        numberOfNights: Int
    ) {
        self.price = price
        self.description = description
        self.title = title
        self.images = images
        self.activities = activities
        self.airfare = airfare
        self.numberOfNights = numberOfNights
    }
    
    init(data: [String: Any]) {
        price = data["price"] as? Int ?? 0
        description = data["description"] as? String ?? ""
        title = data["title"] as? String ?? ""
        images = data["images"] as? [String] ?? []
        activities = data["activities"] as? String ?? ""
        airfare = data["airfare"] as? String ?? ""
        numberOfNights = data["numberOfNights"] as? Int ?? 0
    }
    
}
