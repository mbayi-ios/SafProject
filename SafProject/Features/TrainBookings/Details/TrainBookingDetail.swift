//
//  TrainBookingDetail.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct TrainBookingDetail: View {
    @State private var trainBookingInfo: TrainBookingDetailResponse?
    
    var body: some View {
        ZStack {
            Theme.background
                .ignoresSafeArea(edges: .top)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Group {
                        Text(trainBookingInfo?.data.passengerName ?? "no name")
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 18)
                }
                .padding()
            }
        }
        .navigationTitle("User Details")
        .onAppear {
            do {
                trainBookingInfo = try StaticJSONMapper.decode(file: "SingleBooking", type: TrainBookingDetailResponse.self)
            } catch {
                print(error)
            }
        }
    }
}
