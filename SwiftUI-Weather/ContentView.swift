//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kavya Athmuri on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(ImageName: isNight ? "moon.stars.fill": "cloud.sun.fill",
                                      temprature: 76)
                
                HStack(spacing:10){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.snow.fill", temperature: -10)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.fog.fill", temperature: 0)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.bolt.rain.fill", temperature: 33)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "wind.snow", temperature: 40)
                }
                Spacer()
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: Color.white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium,design:.default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 22,weight:.medium,design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var ImageName: String
    var temprature: Int
    var body: some View{
        VStack(spacing:10){
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100,height: 100)
            
            Text("\(temprature)°")
                .font(.system(size: 50, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom,40)
    }
}
