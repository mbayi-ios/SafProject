//
//  ContentView.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TrainStation()
                .tabItem {
                    Symbols.trainStation
                    Text("Train Station")
                }
            
            TrainBooking()
            .tabItem {
                Symbols.trainBooking
                Text("Train Booking")
            }
            
            
           
        }
    }
}






