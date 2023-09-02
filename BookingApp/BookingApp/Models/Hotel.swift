//
//  Hotel.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation

struct Hotel: Codable, Hashable {
    
    static func == (lhs: Hotel, rhs: Hotel) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name, adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
    
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        }
}

struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}
