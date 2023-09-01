//
//  BookingView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct BookingView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Button {
                coordinator.push(.orderPage)
            } label: {
                Text("Go to order page")
            }

        }
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar(id: "navigationBar") {
            ToolbarItem(id: "BackButton", placement: .navigationBarLeading) {
                Button {
                    coordinator.removeLast()
                } label: {
                    Image("arrowBack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 32, height: 32)
            }
        }
        
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
