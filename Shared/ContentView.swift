//
//  ContentView.swift
//  Shared
//
//  Created by Satvik Kathpal on 2021-11-10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fetcher : WeatherFetcher
    var body: some View {
        NavigationView{
            VStack(){
                Text(fetcher.weatherList.name)
                Text(fetcher.weatherList.region)
                Text(fetcher.weatherList.country)
                Text(String(fetcher.weatherList.lat))
                Text(String(fetcher.weatherList.lon))
                Text(fetcher.weatherList.localtime)
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
