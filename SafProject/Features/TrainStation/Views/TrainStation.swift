//
//  TrainStation.swift
//  SafProject
//
//  Created by Ambrose Mbayi on 08/03/2024.
//

import SwiftUI

struct TrainStation: View {
    @State private var trainStation: [TrainStationModel] = []
    
    private var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background
                    .ignoresSafeArea(edges: .top)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(trainStation, id: \.id) { station in
                            VStack {
                                NavigationLink {
                                    TrainStationDetail()
                                } label: {
                                    TrainStationItem(train: station)
                                }
                                
                            }
                        }
                        
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Train Station")
            .onAppear {
                
                // MARK: - Comment out this to use static data from jsonMapper
                /*
                do {
                    let res = try StaticJSONMapper.decode(file: "TrainStation", type: TrainStationResponse.self)
                    trainStation = res.data
                }
                catch {
                    print(error)
                }
                 */
                
                // MARK: - This is fetching Data directing from the api
                fetchData()
            }
            
            
        }
    }
    func fetchData() {
        guard let url = URL(string: "http://localhost:8088/api/v1/stations") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let trainStation = try JSONDecoder().decode([TrainStationModel].self, from: data)
                DispatchQueue.main.async {
                    self.trainStation = trainStation
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
