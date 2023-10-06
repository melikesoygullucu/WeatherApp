//
//  ContentView.swift
//  Weather App
//
//  Created by Melike Soygüllücü on 5.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            WelcomeView()
                .environmentObject(locationManager)
        }
        .background(Color(hue: 0.704, saturation: 0.973, brightness: 0.921))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
