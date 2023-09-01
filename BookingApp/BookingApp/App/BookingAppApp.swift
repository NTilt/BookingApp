//
//  BookingAppApp.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

@main
struct BookingAppApp: App {
    
    @StateObject var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                HotelView()
                    .preferredColorScheme(.light)
                    .navigationDestination(for: Page.self, destination: { page in
                        ViewFactory.shared.getViewPage(for: page)
                    })
            }
            .environmentObject(coordinator)
            
        }
    }
}
