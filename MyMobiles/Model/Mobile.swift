//
//  Mobile.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation

class Mobile {
    var name: String
    var model: String
    var cost: Int
    var color: String
    var battery: Int
    var primaryCamera: String
    var secondaryCamera: String
    var memory: String
    
    init(mobileViewModel: MobileViewModel) {
        self.name = mobileViewModel.name
        self.cost = mobileViewModel.cost
        self.model = mobileViewModel.model
        self.color = mobileViewModel.color
        self.battery = mobileViewModel.battery
        self.primaryCamera = mobileViewModel.primaryCamera
        self.secondaryCamera = mobileViewModel.secondaryCamera
        self.memory = mobileViewModel.memory
    }
    
    init(name: String, model: String, cost: Int, color: String, battery: Int, primaryCamera: String, secondaryCamera: String, memory: String) {
        self.name = name
        self.cost = cost
        self.model = model
        self.color = color
        self.battery = battery
        self.primaryCamera = primaryCamera
        self.secondaryCamera = secondaryCamera
        self.memory = memory
    }
}
