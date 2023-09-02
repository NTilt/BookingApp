//
//  HotelView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct HotelView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var viewModel: HotelViewModel
    var currentHotelName: String = "Steigenberger Makadi"
    
    var body: some View {
        VStack {
            ZStack {
                Settings.backgroundColor
                ScrollView {
                    VStack {
                        HeaderView(hotel: viewModel.hotel)
                            .padding(.top)
                            .padding(.bottom)
                            .background(Color.white)
                            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                        DetailsView(hotelTags: $viewModel.hotelTags, hotelDescription: viewModel.hotel.aboutTheHotel.description)
                        Spacer()
                    }
                }
            }
            Button {
                coordinator.push(.roomSelection(hotelName: currentHotelName))
            } label: {
                Text("К выбору номера")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 0.051, green: 0.447, blue: 1))
                    )
                    .padding(.horizontal)
            }
            
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Отель")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

fileprivate enum Settings {
    
    static let backgroundColor = Color(red: 0.965, green: 0.965, blue: 0.976)
    
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView(viewModel: HotelViewModel(hotel: Hotel(
            id: 1,
            name: "Лучший пятизвездочный отель в Хургаде, Египет",
            adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
            minimalPrice: 134268,
            priceForIt: "За тур с перелётом",
            rating: 5,
            ratingName: "Превосходно",
            imageUrls: ["https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"],
            aboutTheHotel: AboutTheHotel(
                description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
                peculiarities: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]
            )
        )))
    }
}
