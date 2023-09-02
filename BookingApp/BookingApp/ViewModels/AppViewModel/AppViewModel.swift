//
//  AppViewModel.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation
import SwiftUI

final class AppViewModel: ObservableObject {
    
    @Published var hotelIsLoading: Bool = true
    @Published var hotel: Hotel?
    
    private var urlForHotelInfo = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    
    init() {
        fetchHotelInfo()
    }
    
    func fetchHotelInfo() {
        HotelService().getHotelData(urlString: urlForHotelInfo) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let hotel):
                    self?.hotel = hotel
                    self?.hotelIsLoading = false
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
    
    
}
