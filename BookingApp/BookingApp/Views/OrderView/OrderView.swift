//
//  OrderView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 01.09.2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Button {
                coordinator.removeAll()
            } label: {
                Text("Go to start")
            }

        }
        .navigationTitle("Заказ оплачен")
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

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
