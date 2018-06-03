//
//  MobileDetailViewModel.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import RealmSwift

class MobileDetailViewModel {
    
    var name: String
    var model: String
    var cost: Int
    var color: String
    var battery: Int
    var primaryCamera: String
    var secondaryCamera: String
    var memory: String
    
    var showOtherFeatures: Bool = false
            
    init(mobile: Mobile) {
        self.name = mobile.name
        self.cost = mobile.cost
        self.model = mobile.model
        self.color = mobile.color
        self.battery = mobile.battery
        self.primaryCamera = mobile.primaryCamera
        self.secondaryCamera = mobile.secondaryCamera
        self.memory = mobile.memory
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
        saveMobile()
    }
    
    private func saveMobile() {
        DataService.sharedInstance.saveMobile(object: Mobile.init(mobileViewModel: self))
    }
    
}

