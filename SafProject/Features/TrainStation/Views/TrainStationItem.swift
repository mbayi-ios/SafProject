//
//  TrainStationItem.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct TrainStationItem: View {
    let train: TrainStationModel
    
    var images = ["train-1", "train-2", "train-3", "train-4", "train-5"]
    
    var body: some View {
        VStack {
            VStack {
                Image(images.randomElement()!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(height: 130)
                    .clipped()
                    
                
                Text("\(train.stationName)")
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
