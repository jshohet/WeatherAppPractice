//
//  ContentView.swift
//  WeatherAppPractice
//
//  Created by Josef Shohet on 10/27/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        VStack{
            Text("Weather Today")
                .font(.title)
                
            Image(systemName:"cloud.sun.rain")
                .resizable()
                .frame(width: 50, height: 50)
        }       
        
        TabView{
            Tab("Home", systemImage: "house"){
               WeatherTodayView()
            }
            Tab("Forecast", systemImage: "calendar"){
                _DayView()
            }
        }
    }
}

#Preview {
    MainView()
}
