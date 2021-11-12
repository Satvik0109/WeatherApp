//
//  LocationHelper.swift
//  WeatherApp
//
//  Created by Satvik Kathpal on 2021-11-11.
//  991487352

import Foundation
import MapKit

class LocationAndWeatherFetcher: NSObject, ObservableObject, CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    var apiURL = "http://api.weatherapi.com/v1/current.json?key=c3d7e1deb7eb4db18cf201857211011&q="
    
    @Published var weather = Weather()
    
    override init() {
        super.init()
        fetchDataFromAPI()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            return
        }
        self.location = location
    }
    
    func fetchDataFromAPI(){
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        
        apiURL += String(coordinate.latitude) + "," + String(coordinate.longitude) + "&aqi=no"
        print(apiURL)
        guard let api = URL(string: apiURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: api){(data: Data?, response: URLResponse?, error: Error?) in
            if let err = error{
                print(#function, err)
            }else{
                DispatchQueue.global().async {
                    do{
                        if let jsonData = data{
                            let decoder = JSONDecoder()
                            let decodedWeatherList = try decoder.decode(Weather.self, from: jsonData)
                            DispatchQueue.main.async {
                                self.weather = decodedWeatherList
                            }
                        }else{
                            print(#function, "No JSON data recieved")
                        }
                    }catch let error{
                        print(#function, error)
                    }
                }
            }
        }.resume()
    }
}
