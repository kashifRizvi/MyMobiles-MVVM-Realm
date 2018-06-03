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
    @objc dynamic var cost: String = ""
    @objc dynamic var color: String = ""
    @objc dynamic var battery: String = ""
    @objc dynamic var primaryCamera: String = ""
    @objc dynamic var secondaryCamera: String = ""
    @objc dynamic var memory: String = ""
    @objc dynamic var date: Date = Date()
    
    convenience init(mobileViewModel: MobileDetailViewModel) {
        self.init()
        self.name = mobileViewModel.name
        self.cost = mobileViewModel.cost
        self.color = mobileViewModel.color
        self.battery = mobileViewModel.battery
        self.primaryCamera = mobileViewModel.primaryCamera
        self.secondaryCamera = mobileViewModel.secondaryCamera
        self.memory = mobileViewModel.memory
    }
    
    convenience init(name: String, cost: String, color: String, battery: String, primaryCamera: String, secondaryCamera: String, memory: String) {
        self.init()
        self.name = name
        self.cost = cost
        self.color = color
        self.battery = battery
        self.primaryCamera = primaryCamera
        self.secondaryCamera = secondaryCamera
        self.memory = memory
    }
}
