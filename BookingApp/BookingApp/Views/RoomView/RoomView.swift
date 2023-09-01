//
//  RoomView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct RoomView: View {
    
    @ObservedObject var viewModel: RoomViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Button {
                coordinator.push(.bookingPage)
            } label: {
                Text("Go to bookingPage")
            }
        }
        .navigationTitle(viewModel.hotelName)
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

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(viewModel: RoomViewModel(hotelName: "asd"))
    }
}
