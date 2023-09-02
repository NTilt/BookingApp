//
//  RoomViewModel.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import Foundation

enum RoomError: Error {
    case badURL
    case someError
    case decodingError
}

final class RoomService {
    
    func getRoomsData(urlString: String, completion: @escaping(Result<Rooms, HotelError>) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.someError))
            }
            let roomsResponse = try? JSONDecoder().decode(Rooms.self, from: data)
            if let roomsResponse = roomsResponse {
                return completion(.success(roomsResponse))
            }
            else {
                return completion(.failure(.decodingError))
            }
        }
        .resume()
    }
    
}

final class RoomViewModel: ObservableObject {
    
    @Published var rooms: [Room] = [Room]()
    @Published var roomsIsLoading: Bool = true
    @Published var roomsTags: [Room: [Tag]] = [:]
    
    var hotelName: String
    private var urlForRooms = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
    
    init(hotelName: String) {
        self.hotelName = hotelName
    }
    
    func createRoomTags(from rooms: [Room]){
        rooms.forEach { room in
            var tagItems: [Tag] = []
            room.peculiarities.forEach { tagString in
                tagItems.append(Tag(text: tagString))
            }
            roomsTags[room] = tagItems
        }
    }
    
    func fetchRooms() {
        RoomService().getRoomsData(urlString: urlForRooms) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let rooms):
                    self?.rooms = rooms.rooms
                    self?.createRoomTags(from: rooms.rooms)
                    self?.roomsIsLoading = false
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}
