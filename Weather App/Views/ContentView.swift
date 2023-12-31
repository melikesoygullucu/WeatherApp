//
//  ContentView.swift
//  Weather App
//
//  Created by Melike Soygüllücü on 5.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather {
                    Text("Weather data fetched! \(location.latitude), \(location.longitude)")
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }    
            }
        }
        .background(Color(hue: 0.704, saturation: 0.919, brightness: 0.363))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
