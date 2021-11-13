//
//  ContentView.swift
//  Shared
//
//  Created by Satvik Kathpal on 2021-11-10.
//  991487352

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager : LocationAndWeatherFetcher
    
    var body: some View {
        splashImageBackground
            .overlay(
                VStack(){
                    HStack(){
                        VStack(alignment: .leading){
                            Text(locationManager.weather.name)
                                .modifier(LightHeading())
                            Text("\(locationManager.weather.region), \(locationManager.weather.country)")
                                .modifier(UltraLightSubtext())
                            Text("\(locationManager.weather.lat)/\(locationManager.weather.lon)")
                                .modifier(LightSubtextSmall())
                        }.colorInvert()
                        .padding()
                        Spacer()
                    }//Location Info
                    
                    Spacer()
                    
                    VStack(){
                        let imageText: String = getImage(code: locationManager.weather.cond_code)
                        Image(imageText)
                            .resizable()
                            .frame(width: 250, height: 250)
                        Text("\(locationManager.weather.cond_text)")
                            .modifier(LightSubtext())
                            .colorInvert()
                    }//Weather Condition
                    
                    Spacer()
                    
                    HStack(){
                        VStack(alignment: .leading){
                            HStack(){
                                Image("009-wind-1")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("\(Int(locationManager.weather.wind_kph)) kph")
                                    .colorInvert()
                                    .modifier(LightSubtext())
                            }
                            HStack(){
                                Image("023-windsock")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("\(locationManager.weather.wind_dir)")
                                    .colorInvert()
                                    .modifier(LightSubtext())
                            }
                            HStack(){
                                Image("021-umbrella")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("\(Int(locationManager.weather.precip_mm)) mm")
                                    .colorInvert()
                                    .modifier(LightSubtext())
                            }
                            HStack(){
                                Image("001-barometer")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("\(Int(locationManager.weather.humidity))%")
                                    .colorInvert()
                                    .modifier(LightSubtext())
                            }
                            HStack(){
                                Image("001-binoculars")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("\(Int(locationManager.weather.vis_km)) km")
                                    .colorInvert()
                                    .modifier(LightSubtext())
                            }
                            HStack(){
                                Image("002-uv")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("\(Int(locationManager.weather.uv))")
                                    .colorInvert()
                                    .modifier(LightSubtext())
                            }
                        }// Weather Data (Wind/Rain/UV etc)
                        
                        Spacer()
                        
                        VStack(){
                            Text("\(Int(locationManager.weather.temp_c))º")
                                .modifier(TemperatureText())
                                .colorInvert()
                            Text("\(Int(locationManager.weather.temp_f))ºF / Feels Like: \(Int(locationManager.weather.feelslike_c))ºC")
                                .colorInvert()
                                .modifier(UltraLightSubtext())
                        }//Temperature Data
                        .padding()
                    }.padding()
                }
            )
    }
    private var splashImageBackground: some View {      //sets background image
        GeometryReader { geometry in
            Image("black")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width)
        }
    }
    func getImage(code:Int) -> String {     //Reads weather condition code from api and returns filename for weather condition icon
        var isDay: Bool
        if locationManager.weather.is_day == 0 {
            isDay = true
        }else{
            isDay = false
        }
        switch code {
        case 1000:
            if isDay {return "014-sun"}     //sunny
            return "024-moon-phase"         //clear
        case 1003:
            if isDay {return "013-clouds-and-sun"}      //partial clouds
            return "011-cloudy"                         //clouds
        case 1006,1009:
            return "011-cloudy"                         //clouds
        case 1030,1135,1147:
            if isDay {return "003-fog-1"}               //fog
            return "002-fog"                            //fog night
        case 1063,1150,1180,1183:
            if isDay {return "022-rain-2"}              //light rain
            return "008-rain"                           //light rain night
        case 1066,1114,1210,1213,1216,1219,1222,1255:
            if isDay {return "020-snow-1"}              //snowfall
            return "004-snow"                           //snowfall night
        case 1069,1072,1168,1171,1198,1201,1204,1207,1237,1249,1252,1261,1264:
            return "010-sleet"                          //sleet
        case 1087:
            return "016-thunderstorm"                   //thunder
        case 1117,1225,1258:
            return "005-snowflake"                      //heavy snow
        case 1186,1189,1192,1195,1240,1243,1246:
            return "017-rain-1"                         //rain
        case 1273,1276,1279,1282:
            return "019-storm"
        default:
            return "014-sun"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
