//
//  HotelViewModel.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation
import SwiftUI

enum HotelError: Error {
    case badURL
    case someError
    case decodingError
}

final class HotelService {
    
    func getHotelData(urlString: String, completion: @escaping(Result<Hotel, HotelError>) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.someError))
            }
            let hotelResponse = try? JSONDecoder().decode(Hotel.self, from: data)
            if let hotelResponse = hotelResponse {
                return completion(.success(hotelResponse))
            }
            else {
                return completion(.failure(.decodingError))
            }
        }
        .resume()
    }
    
}


final class HotelViewModel: ObservableObject {
    
    @Published var hotel: Hotel
    @Published var hotelTags: [Tag] = [Tag]()
    
    init(hotel: Hotel) {
        self.hotel = hotel
        hotel.aboutTheHotel.peculiarities.forEach {
            hotelTags.append(Tag(text: $0))
        }
        
            
    }
    
}
