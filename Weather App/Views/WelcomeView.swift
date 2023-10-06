//
//  WelcomeView.swift
//  Weather App
//
//  Created by Melike Soygüllücü on 6.10.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Please share your current location to get the weather in your area.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30.0)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
