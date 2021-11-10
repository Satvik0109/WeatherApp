//
//  Weather.swift
//  WeatherApp
//
//  Created by Satvik Kathpal on 2021-11-10.
//  991487352

import Foundation

struct Weather: Codable, Identifiable{
    
    var id : Int
    //Location Info
    var name : String
    var region : String
    var country : String
    var lat : Double
    var lon : Double
    var localtime : String
    //Temperature Info
    var temp_c : Float
    var temp_f : Float
    var is_day : Bool
    var cond_text : String
    var cond_icon : String
    //Wind Info
    var wind_kph : Float
    var wind_degree : Float
    var wind_dir : String
    //Rain Info
    var precip_mm : Float
    var humidity : Float
    var cloud : Bool
    //Other
    var feelslike_c : Float
    var vis_km : Float
    var uv : Float
    
    enum CodingKeys: String, CodingKey{
        case id = "localtime_epoch"
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case localtime = "localtime"
        case temp_c = "temp_c"
        case temp_f = "temp_f"
        case is_day = "is_day"
        case cond_text = "cond_text"
        case cond_icon = "cond_icon"
        case wind_kph = "wind_kph"
        case wind_degree = "wind_degree"
        case wind_dir = "wind_dir"
        case precip_mm = "precip_mm"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslike_c = "feelslike_c"
        case vis_km = "vis_km"
        case uv = "uv"
    }
    
    init(){
        id = 0
        name = ""
        region = ""
        country = ""
        lat = 0
        lon = 0
        localtime = ""
        temp_c = 0
        temp_f = 0
        is_day = false
        cond_text = ""
        cond_icon = ""
        wind_kph = 0
        wind_degree = 0
        wind_dir = ""
        precip_mm = 0
        humidity = 0
        cloud = false
        feelslike_c = 0
        vis_km = 0
        uv = 0
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try response.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "Unavailable"
        self.region = try response.decodeIfPresent(String.self, forKey: .region) ?? "Unavailable"
        self.country = try response.decodeIfPresent(String.self, forKey: .country) ?? "Unavailable"
        self.lat = try response.decodeIfPresent(Double.self, forKey: .lat) ?? 0
        self.lon = try response.decodeIfPresent(Double.self, forKey: .lon) ?? 0
        self.localtime = try response.decodeIfPresent(String.self, forKey: .localtime) ?? "Unavailable"
        self.temp_c = try response.decodeIfPresent(Float.self, forKey: .temp_c) ?? 0
        self.temp_f = try response.decodeIfPresent(Float.self, forKey: .temp_f) ?? 0
        self.is_day = try response.decodeIfPresent(Bool.self, forKey: .is_day) ?? false
        self.cond_text = try response.decodeIfPresent(String.self, forKey: .cond_text) ?? "Unavailable"
        self.cond_icon = try response.decodeIfPresent(String.self, forKey: .cond_icon) ?? "Unavailable"
        self.wind_kph = try response.decodeIfPresent(Float.self, forKey: .wind_kph) ?? 0
        self.wind_degree = try response.decodeIfPresent(Float.self, forKey: .wind_degree) ?? 0
        self.wind_dir = try response.decodeIfPresent(String.self, forKey: .wind_dir) ?? "Unavailable"
        self.precip_mm = try response.decodeIfPresent(Float.self, forKey: .precip_mm) ?? 0
        self.humidity = try response.decodeIfPresent(Float.self, forKey: .humidity) ?? 0
        self.cloud = try response.decodeIfPresent(Bool.self, forKey: .cloud) ?? false
        self.feelslike_c = try response.decodeIfPresent(Float.self, forKey: .feelslike_c) ?? 0
        self.vis_km = try response.decodeIfPresent(Float.self, forKey: .vis_km) ?? 0
        self.uv = try response.decodeIfPresent(Float.self, forKey: .uv) ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        //Nothing to encode
    }
}
