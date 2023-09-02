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
    @StateObject var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            if appViewModel.hotelIsLoading {
                ProgressView()
            }
            else {
                NavigationStack(path: $coordinator.path) {
                    ViewFactory.shared.getViewPage(for: .hotelPage(hotel: appViewModel.hotel))
                        .navigationDestination(for: Page.self, destination: { page in
                            ViewFactory.shared.getViewPage(for: page)
                        })
                        .preferredColorScheme(.light)
                }
                .environmentObject(coordinator)
            }
            
            
        }
    }
}
