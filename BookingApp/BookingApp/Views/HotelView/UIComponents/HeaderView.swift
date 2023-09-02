//
//  HeaderView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct HeaderView: View {
    
    var hotel: Hotel
    
    init(hotel: Hotel) {
        self.hotel = hotel
    }
    
    var body: some View {
        VStack(spacing: 16) {
            CarouselView(imagesUrl: hotel.imageUrls)
            VStack(spacing: 8) {
                review
                hotelName
                addressButton
            }
            .padding(.leading)
            priceSection
        }
    }
    
    var priceSection: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("от \(setHotelPrice(price:hotel.minimalPrice).0) \(setHotelPrice(price:hotel.minimalPrice).1) ₽")
                .font(.system(size: 30, weight: .semibold))
            Text(hotel.priceForIt.lowercased())
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Settings.priceForItColor)
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var addressButton: some View {
        Button {
            
        } label: {
            Text(hotel.adress)
                .font(.system(size: 14, weight: .medium))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var hotelName: some View {
        Text("Steigenberger Makadi")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 22, weight: .medium))
    }
    
    var review: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .foregroundColor(Settings.ratingTextColor)
            Text("\(hotel.rating) \(hotel.ratingName)")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Settings.ratingTextColor)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Settings.ratingFillColor)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func setHotelPrice(price: Int) -> (Int, Int) {
        let firstPart = price / 1000
        let secondPart = Int(price % 1000)
        return (firstPart, secondPart)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(hotel: Hotel(
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
        ))
    }
}

fileprivate enum Settings {
    
    static let ratingFillColor = Color(red: 1, green: 0.78, blue: 0, opacity: 0.2)
    static let ratingTextColor = Color(red: 1, green: 0.659, blue: 0)
    static let priceForItColor = Color(red: 0.51, green: 0.529, blue: 0.588)
}
