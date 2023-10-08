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
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                Text("Your coordinates are:  /(location.longitude), /(location.latitude)")
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
