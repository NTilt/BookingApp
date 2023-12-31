//
//  Room.swift
//  BookingApp
//
//  Created by Никита Ясеник on 02.09.2023.
//

import Foundation

struct Rooms: Codable {
    let rooms: [Room]
}

struct Room: Codable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
