//
//  TrainStationDetail.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct TrainStationDetail: View {
   @State private var trainStationInfo: TrainStationDetailResponse?
    
    var body: some View {
        ZStack {
            Theme.background
                .ignoresSafeArea(edges: .top)
            
            ScrollView {
                VStack {
                    Text(trainStationInfo?.data.stationName ?? "no name")
                }
            }
        }
        .navigationTitle("Train Station Details")
        .onAppear {
            do {
                trainStationInfo = try StaticJSONMapper.decode(file: "SingleTrainStation", type: TrainStationDetailResponse.self)
            } catch {
                print(error)
            }
        }
    }
}
