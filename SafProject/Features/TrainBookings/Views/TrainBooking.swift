//
//  TrainBooking.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct TrainBooking: View {
    @State private var trainBooking: [TrainBookingModel] = []
    private var columns = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background
                    .ignoresSafeArea(edges: .top)
            
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(trainBooking, id: \.id) { train in
                            VStack {
                                NavigationLink {
                                    TrainBookingDetail()
                                } label: {
                                    TrainBookingItem(booking: train)
                                }
                                
                            }
                        }
                    }
                    .padding()
                }
                
               
            }
            .navigationTitle("Train Bookings")
            .onAppear {
                
                // MARK: - Comment out this to use static data from jsonMapper
                
                do {
                    let res = try StaticJSONMapper.decode(file: "TrainBooking", type: TrainBookingResponse.self)
                    trainBooking = res.data
                }
                catch {
                    print(error)
                }
                 
                
               // fetchTrainBookingData()
            }
        }
    }
    
    func fetchTrainBookingData() {
        guard let url = URL(string: "http://localhost:8088/api/v1/trains/bookings") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let trainBooking = try JSONDecoder().decode([TrainBookingModel].self, from: data)
                DispatchQueue.main.async {
                    self.trainBooking = trainBooking
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
