//
//  Mobile.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import RealmSwift

class Mobile: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var cost: Int = 0
    @objc dynamic var color: String = ""
    @objc dynamic var battery: Int = 0
    @objc dynamic var primaryCamera: String = ""
    @objc dynamic var secondaryCamera: String = ""
    @objc dynamic var memory: String = ""
    
    convenience init(mobileViewModel: MobileDetailViewModel) {
        self.init()
        self.name = mobileViewModel.name
        self.cost = mobileViewModel.cost
        self.model = mobileViewModel.model
        self.color = mobileViewModel.color
        self.battery = mobileViewModel.battery
        self.primaryCamera = mobileViewModel.primaryCamera
        self.secondaryCamera = mobileViewModel.secondaryCamera
        self.memory = mobileViewModel.memory
    }
    
    convenience init(name: String, model: String, cost: Int, color: String, battery: Int, primaryCamera: String, secondaryCamera: String, memory: String) {
        self.init()
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
