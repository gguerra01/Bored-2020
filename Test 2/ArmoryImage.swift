//
//  ArmoryImage.swift
//  Test 2
//
//  Created by Gian Guerra on 3/3/20.
//  Copyright © 2020 Gian Guerra. All rights reserved.
//

import SwiftUI

struct ArmoryImage: View {
    var body: some View {
        Image("armory")
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.gray, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct ArmoryImage_Previews: PreviewProvider {
    static var previews: some View {
        ArmoryImage()
    }
}
