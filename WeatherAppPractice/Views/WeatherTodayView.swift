//
//  WeatherTodayView.swift
//  WeatherAppPractice
//
//  Created by Josef Shohet on 10/31/24.
//

import SwiftUI

struct WeatherTodayView: View {
    
    @StateObject var weatherModel = WeatherTodayModel()
    
    let apiKey = Bundle.main.infoDictionary?["WEATHER_API_KEY"] as? String ?? "No Api Key Found"
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text("Search for a city:")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                HStack (alignment: .center) {
                    TextField("Enter city", text: $weatherModel.city)
                        .frame(width: 200, height: 20)
                        .font(.title)                        
                    Button{
                        weatherModel.setCity(weatherModel.city)
                    }label:{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(Color.gray)
                        
                    }
                }
                .padding(7)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .listRowSeparator(.hidden)
            }
            .background(Color.white)
            .scrollContentBackground(.hidden)
            .frame(width: 300, height: 200)
            
            Text("\(weatherModel.city) Weather")
                .font(.headline)
        }
        .frame(width: 300, height: 200, alignment: .center)      
    }
}

#Preview {
    WeatherTodayView()
}
