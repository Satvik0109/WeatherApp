//
//  Weather.swift
//  WeatherApp
//
//  Created by Satvik Kathpal on 2021-11-10.
//  991487352

import Foundation

struct Weather: Codable{
    
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
    var is_day : Int
    var cond_text : String
    var cond_icon : String
    //Wind Info
    var wind_kph : Float
    var wind_degree : Float
    var wind_dir : String
    //Rain Info
    var precip_mm : Float
    var humidity : Float
    var cloud : Int
    //Other
    var feelslike_c : Float
    var vis_km : Float
    var uv : Float
    
    enum CodingKeys: String, CodingKey{
        case location = "location"
        case current = "current"
    }
    
    init(){
        name = ""
        region = ""
        country = ""
        lat = 0
        lon = 0
        localtime = ""
        temp_c = 0
        temp_f = 0
        is_day = 0
        cond_text = ""
        cond_icon = ""
        wind_kph = 0
        wind_degree = 0
        wind_dir = ""
        precip_mm = 0
        humidity = 0
        cloud = 0
        feelslike_c = 0
        vis_km = 0
        uv = 0
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        let locationContainer = try response.decodeIfPresent(Location.self, forKey: .location)
        let currentContainer = try response.decodeIfPresent(Current.self, forKey: .current)
        
        self.name = locationContainer?.name ?? "Unavailable"
        self.region = locationContainer?.region ?? "Unavailable"
        self.country = locationContainer?.country ?? "Unavailable"
        self.lat = locationContainer?.lat ?? 0
        self.lon = locationContainer?.lon ?? 0
        self.localtime = locationContainer?.localtime ?? "Unavailable"
        self.temp_c = currentContainer?.temp_c ?? 0
        self.temp_f = currentContainer?.temp_f ?? 0
        self.is_day = currentContainer?.is_day ?? 0
        self.cond_text = currentContainer?.cond_text ?? "Unavailable"
        self.cond_icon = currentContainer?.cond_icon ?? "Unavailable"
        self.wind_kph = currentContainer?.wind_kph ?? 0
        self.wind_degree = currentContainer?.wind_degree ?? 0
        self.wind_dir = currentContainer?.wind_dir ?? "Unavailable"
        self.precip_mm = currentContainer?.precip_mm ?? 0
        self.humidity = currentContainer?.humidity ?? 0
        self.cloud = currentContainer?.cloud ?? 0
        self.feelslike_c = currentContainer?.feelslike_c ?? 0
        self.vis_km = currentContainer?.vis_km ?? 0
        self.uv = currentContainer?.uv ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        //Nothing to encode
    }
}

struct Location:Codable{
    //Location Info
    var name : String
    var region : String
    var country : String
    var lat : Double
    var lon : Double
    var localtime : String
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case localtime = "localtime"
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "Unavailable"
        self.region = try response.decodeIfPresent(String.self, forKey: .region) ?? "Unavailable"
        self.country = try response.decodeIfPresent(String.self, forKey: .country) ?? "Unavailable"
        self.lat = try response.decodeIfPresent(Double.self, forKey: .lat) ?? 0
        self.lon = try response.decodeIfPresent(Double.self, forKey: .lon) ?? 0
        self.localtime = try response.decodeIfPresent(String.self, forKey: .localtime) ?? "Unavailable"
    }
    func encode(to encoder: Encoder) throws {
        //nothing to encode
    }
}

struct Current: Codable{
    
    //Temperature Info
    var temp_c : Float
    var temp_f : Float
    var is_day : Int
    var cond_text : String
    var cond_icon : String
    //Wind Info
    var wind_kph : Float
    var wind_degree : Float
    var wind_dir : String
    //Rain Info
    var precip_mm : Float
    var humidity : Float
    var cloud : Int
    //Other
    var feelslike_c : Float
    var vis_km : Float
    var uv : Float
    
    enum CodingKeys: String, CodingKey{
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
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp_c = try response.decodeIfPresent(Float.self, forKey: .temp_c) ?? 0
        self.temp_f = try response.decodeIfPresent(Float.self, forKey: .temp_f) ?? 0
        self.is_day = try response.decodeIfPresent(Int.self, forKey: .is_day) ?? 0
        self.cond_text = try response.decodeIfPresent(String.self, forKey: .cond_text) ?? "Unavailable"
        self.cond_icon = try response.decodeIfPresent(String.self, forKey: .cond_icon) ?? "Unavailable"
        self.wind_kph = try response.decodeIfPresent(Float.self, forKey: .wind_kph) ?? 0
        self.wind_degree = try response.decodeIfPresent(Float.self, forKey: .wind_degree) ?? 0
        self.wind_dir = try response.decodeIfPresent(String.self, forKey: .wind_dir) ?? "Unavailable"
        self.precip_mm = try response.decodeIfPresent(Float.self, forKey: .precip_mm) ?? 0
        self.humidity = try response.decodeIfPresent(Float.self, forKey: .humidity) ?? 0
        self.cloud = try response.decodeIfPresent(Int.self, forKey: .cloud) ?? 0
        self.feelslike_c = try response.decodeIfPresent(Float.self, forKey: .feelslike_c) ?? 0
        self.vis_km = try response.decodeIfPresent(Float.self, forKey: .vis_km) ?? 0
        self.uv = try response.decodeIfPresent(Float.self, forKey: .uv) ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        //Nothing to encode
    }

}
