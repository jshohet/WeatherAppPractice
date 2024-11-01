//
//  WeatherTodayModel.swift
//  WeatherAppPractice
//
//  Created by Josef Shohet on 10/31/24.
//

import Foundation
import CoreLocation

class WeatherTodayModel: ObservableObject {
    
    @Published var city : String = "Boston, MA"
    @Published var lat: Double = 42.3602558
    @Published var long: Double = -71.0572791
    
    init(){}
    
    func setCity(_ city: String) -> (lat: Double, long: Double){
        self.city = city
        
        cityToCoords(address: city){
            coordinate, error  in
            guard let coordinate = coordinate, error == nil else { return }
            DispatchQueue.main.async{
                self.lat = coordinate.latitude
                self.long = coordinate.longitude
            }
        }
        return (lat: lat, long: long)
    }
    
    func cityToCoords(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?)-> ()){
        CLGeocoder().geocodeAddressString(address) {
            completion($0?.first?.location?.coordinate, $1)
        }
    }
    
}
