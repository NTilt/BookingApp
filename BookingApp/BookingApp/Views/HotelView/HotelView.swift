//
//  HotelView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct HotelView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    var currentHotelName: String = "Steigenberger Makadi"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button {
                coordinator.push(.roomSelection(hotelName: currentHotelName))
            } label: {
                Text("Go to roomSelection")
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .navigationTitle("Отель")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
