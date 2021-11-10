//
//  WeatherFetcher.swift
//  WeatherApp
//
//  Created by Satvik Kathpal on 2021-11-10.
//  991487352

import Foundation

class WeatherFetcher : ObservableObject{
    
    var apiURL = "http://api.weatherapi.com/v1/current.json?key=c3d7e1deb7eb4db18cf201857211011&q=43.642567,-79.387054&aqi=no"
    
    @Published var weatherList = Weather()
    
    init(){
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI(){
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
                                self.weatherList = decodedWeatherList
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
