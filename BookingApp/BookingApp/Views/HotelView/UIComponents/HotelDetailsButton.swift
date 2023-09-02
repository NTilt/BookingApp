//
//  HotelDetailsButton.swift
//  BookingApp
//
//  Created by Никита Ясеник on 02.09.2023.
//

import SwiftUI

struct HotelDetailsButton: View {
    var icon: String
    var title: String
    var subTitle: String
    
    var body: some View {
        
        Button {
            
        } label: {
            HStack(spacing: 12) {
                Image(icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    Text(subTitle)
                        .foregroundColor(Color(red: 0.51, green: 0.529, blue: 0.588))
                        .font(.system(size: 14, weight: .medium))
                }
                Spacer()
                Image("rightArrow")
            }
        }
        
    }
}

struct HotelDetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailsButton(
            icon: "emoji-happy",
            title: "Удобства",
            subTitle: "Самое необходиоме"
        )
    }
}
