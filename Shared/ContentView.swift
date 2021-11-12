//
//  ContentView.swift
//  Shared
//
//  Created by Satvik Kathpal on 2021-11-10.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager : LocationAndWeatherFetcher
    var body: some View {
        NavigationView{
            VStack(){
                Text(locationManager.weather.name)
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
