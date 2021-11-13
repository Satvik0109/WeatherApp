//
//  CustomViewModifiers.swift
//  WeatherApp
//
//  Created by Satvik Kathpal on 2021-11-12.
//  991487352

import SwiftUI


struct LightHeading: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 35, weight: .light))
    }
}

struct UltraLightSubtext: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 20, weight: .ultraLight))
    }
}

struct LightSubtextSmall: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 15, weight: .light))
    }
}

struct TemperatureText: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 125, weight: .ultraLight))
    }
}
struct LightSubtext: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 20, weight: .light))
    }
}
