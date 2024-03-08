//
//  TrainBookingResponse.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import Foundation

// json response
/**
 {
 "passengerName": "Gideon",
 "startStation": 2,
 "exitStation": 5
 }
 */

struct TrainBookingResponse: Codable {
    let data: [TrainBookingModel]
}

struct TrainBookingModel: Codable {
    let id: Int
    let passengerName: String
    let startStation: Int
    let exitStation: Int
}


struct TrainBookingDetailResponse: Codable {
    let data: TrainBookingModel
}

