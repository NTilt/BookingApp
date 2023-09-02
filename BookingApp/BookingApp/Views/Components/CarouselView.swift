//
//  CarouselView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct CarouselView: View {
    
    var imagesUrl: [String]
    
    init(imagesUrl: [String]) {
        self.imagesUrl = imagesUrl
    }
    
    var body: some View {
        TabView {
            ForEach(imagesUrl, id: \.self) { imageURL in
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .cornerRadius(15)
                        .padding(.horizontal)
                } placeholder: {
                    ProgressView()
                }
                
            }
        }
        .frame(minHeight: 257)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onAppear {
            changeIndicatorColor()
        }
    }
    
    private func changeIndicatorColor() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
    }
}
