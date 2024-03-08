//
//  TrainStationResponse.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import Foundation


// json response
/**
 {
 "id": 0,
 "stationName": "Nairobi"
 },
 */

struct TrainStationResponse: Codable {
    let data: [TrainStationModel]
}


struct TrainStationModel: Codable {
    let id: Int
    let stationName: String
}


struct TrainStationDetailResponse: Codable {
    let data: TrainStationModel
}
