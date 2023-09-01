//
//  ViewFactory.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation
import SwiftUI

struct ViewFactory {
    
    static let shared = ViewFactory()
    
    @ViewBuilder
    func getViewPage(for page: Page) -> some View {
        switch page {
        case .roomSelection(let hotelName):
            roomSelectionView(hotelName: hotelName)
        case .bookingPage:
            bookingPageView()
        case .orderPage:
            orderPageView()
        }
    }
    
    @ViewBuilder
    private func orderPageView() -> some View {
        OrderView()
    }
    
    @ViewBuilder
    private func bookingPageView() -> some View {
        BookingView()
    }
    
    @ViewBuilder
    private func roomSelectionView(hotelName: String) -> some View {
        let roomViewModel = RoomViewModel(hotelName: hotelName)
        RoomView(viewModel: roomViewModel)
    }
    
}
