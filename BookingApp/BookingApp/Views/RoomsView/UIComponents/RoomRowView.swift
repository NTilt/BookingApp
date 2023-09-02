//
//  RoomRowView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 02.09.2023.
//

import SwiftUI

struct RoomRowView: View {
    
    var room: Room
    @State var tags: [Tag]
    var onSelectRoomButtonTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CarouselView(imagesUrl: room.imageUrls)
            Text(room.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 22, weight: .medium))
                .padding(.horizontal)
            TagView(tags: $tags)
            VStack(alignment: .leading, spacing: 16) {
                roomDetailsButton
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 19) {
                    HStack(alignment: .firstTextBaseline, spacing: 7) {
                        Text("\(setHotelPrice(price:room.price).0) \(setHotelPrice(price: room.price).1) ₽")
                            .font(.system(size: 30, weight: .semibold))
                            .padding(.leading)
                        Text(room.pricePer)
                            .foregroundColor(Color(red: 0.51, green: 0.529, blue: 0.588))
                            .font(.system(size: 16, weight: .regular))
                    }
                    Button {
                        onSelectRoomButtonTap()
                    } label: {
                        Text("Выбрать номер")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.051, green: 0.447, blue: 1))
                            )
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
    }
    
    private func setHotelPrice(price: Int) -> (Int, Int) {
        let firstPart = price / 1000
        let secondPart = Int(price % 1000)
        return (firstPart, secondPart)
    }
    
    private var roomDetailsButton: some View {
        Button {
            
        } label: {
            HStack(spacing: 2) {
                Text("Подробнее о номере")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(red: 0.051, green: 0.447, blue: 1))
                Image("rightArrow")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(red: 0.051, green: 0.447, blue: 1))
            }
            .padding(.vertical, 5)
            .padding(.leading, 10)
            .padding(.trailing, 2)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.051, green: 0.447, blue: 1, opacity: 0.1))
            )
            
        }
    }
}

struct RoomRowView_Previews: PreviewProvider {
    static var previews: some View {
        RoomRowView(room: Room(
            id: 1,
            name: "Стандартный номер с видом на бассейн",
            price: 186600,
            pricePer: "За 7 ночей с перелетом",
            peculiarities: [
                "Включен только завтрак",
                "Кондиционер"
            ],
            imageUrls: [
                "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg"
            ]
        ), tags: [Tag(text: "Включен только завтрак"), Tag(text: "Кондиционер")], onSelectRoomButtonTap: { }
        )
    }
}
