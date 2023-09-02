//
//  RoomsView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct RoomsView: View {
    
    @StateObject var viewModel: RoomViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            if viewModel.roomsIsLoading {
                ProgressView()
            }
            else {
                ZStack {
                    Color(red: 0.965, green: 0.965, blue: 0.976)
                        .ignoresSafeArea()
                    ScrollView {
                        ForEach(viewModel.rooms, id: \.self) { room in
                            tagView(from: room)
                        }
                    }

                }
                                
            }
        }
        .onAppear {
            viewModel.fetchRooms()
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
    
    
    func tagView(from room: Room) -> some View {
        var tags: [Tag] = []
        if let roomTags = viewModel.roomsTags[room] {
            tags = roomTags
        }
        return RoomRowView(room: room, tags: tags) {
            coordinator.push(.bookingPage)
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView(viewModel: RoomViewModel(hotelName: "asd"))
    }
}
