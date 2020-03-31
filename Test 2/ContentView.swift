//
//  ContentView.swift
//  Test 2
//
//  Created by Gian Guerra on 3/3/20.
//  Copyright © 2020 Gian Guerra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 300)
            ArmoryImage()
                .offset(y:-130)
                .padding(.bottom, -130)
            ZStack{
                Color(hex: 0xff744e96)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Red Bank Armory")
                        .font(.title)
                        .foregroundColor(Color.white)
                
                    HStack {
                        Text("Address: 76 Chestnut St")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("New Jersey")
                        .foregroundColor(Color.white)
                    }
                    Text("Phone Number:")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    
                    Text("Website: www.redbankarmory.com")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }
            .padding()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
