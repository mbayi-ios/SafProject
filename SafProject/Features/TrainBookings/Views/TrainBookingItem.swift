//
//  TrainBookingItem.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct TrainBookingItem: View {
    let booking: TrainBookingModel
    
    var body: some View {
        VStack {
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: 130)
                    .clipped()
                
                Text("\(booking.passengerName)")
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Theme.background)
        }
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

