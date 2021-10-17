//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Kavya Athmuri on 17/10/21.
//
import SwiftUI

struct WeatherButton:View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View{
        Text(title)
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,weight: .bold,design:.default))
            .cornerRadius(10)
    }
}
