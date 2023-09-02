//
//  DetailsView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 02.09.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @Binding var hotelTags: [Tag]
    var hotelDescription: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            VStack(spacing: 12) {
                TagView(tags: $hotelTags)
                Text(hotelDescription)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.horizontal)
            }
            VStack {
                HotelDetailsButton(icon: "emoji-happy", title: "Удобства", subTitle: "Самое необходимое")
                Divider()
                    .frame(width: 330)
                    .offset(x: 20)
                HotelDetailsButton(icon: "tick-square", title: "Что включено", subTitle: "Самое необходимое")
                Divider()
                HotelDetailsButton(icon: "close-square", title: "Что не включено", subTitle: "Самое необходимое")
            }
            .padding()
            .background(
                Color(red: 0.965, green: 0.965, blue: 0.976)
            )
            .cornerRadius(20, corners: .allCorners)
            .padding([.horizontal, .bottom])
            
            
            
        }
        .padding(.top)
        .background(Color.white)
        .cornerRadius(12, corners: .allCorners)
        
    }
    
    private var buttonsSections: some View {
        Button {
            
        } label: {
            
        }
    }
}
