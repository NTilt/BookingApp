//
//  AppCoordinator.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation
import SwiftUI

enum Page: Hashable, Identifiable {
    case hotelPage(hotel: Hotel?)
    case roomSelection(hotelName: String)
    case bookingPage
    case orderPage
    
    var id: String {
        switch self {
        case .hotelPage:
            return "HotelPage"
        case .roomSelection:
            return "RoomSelection"
        case .bookingPage:
            return "BookingPage"
        case .orderPage:
            return "OrderPage"
        }
    }
}

final class AppCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func removeLast() {
        path.removeLast()
    }
    
    func removeAll() {
        path.removeLast(path.count)
    }
}
