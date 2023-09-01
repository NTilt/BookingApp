//
//  RoomViewModel.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation

final class RoomViewModel: ObservableObject {
    
    var hotelName: String
    
    init(hotelName: String) {
        self.hotelName = hotelName
    }
    
}
