//
//  WeatherAppApp.swift
//  Shared
//
//  Created by Satvik Kathpal on 2021-11-10.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var helper = LocationAndWeatherFetcher()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(helper)
        }
    }
}
