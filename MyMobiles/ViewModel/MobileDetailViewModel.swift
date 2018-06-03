//
//  MobileDetailViewModel.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import RealmSwift

struct BrokenRule {
    var propertyName: String
    var message: String
}

protocol ViewModel {
    var brokenRules: [BrokenRule] {get set}
    var isValid: Bool {get}
}

class MobileDetailViewModel: ViewModel {
    
    var name: String = ""
    var cost: String = ""
    var color: String = ""
    var battery: String = ""
    var primaryCamera: String = ""
    var secondaryCamera: String = ""
    var memory: String = ""
    
    var showOtherFeatures: Bool = false
    
    var brokenRules: [BrokenRule] = [BrokenRule]()
    
    var isValid: Bool {
        get {
            self.brokenRules = [BrokenRule]()
            self.validateInput()
            return self.brokenRules.count == 0 ? true: false
        }
    }
            
    convenience init(mobile: Mobile) {
        self.init()
        self.name = mobile.name
        self.cost = mobile.cost
        self.color = mobile.color
        self.battery = mobile.battery
        self.primaryCamera = mobile.primaryCamera
        self.secondaryCamera = mobile.secondaryCamera
        self.memory = mobile.memory
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
    
    func saveMobile() {
        DataService.sharedInstance.saveMobile(object: Mobile.init(mobileViewModel: self))
    }
}

extension MobileDetailViewModel {
    private func validateInput() {
        if name.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "name", message: "Name can't be empty!\n"))
        }
        if cost.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "cost", message: "Cost can't be empty!\n"))
        }
        if color.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "color", message: "Color can't be empty!\n"))
        }
        if battery.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "battery", message: "Battery can't be empty!\n"))
        }
        if primaryCamera.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "primaryCamera", message: "Primary Camera can't be empty!\n"))
        }
        if secondaryCamera.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "secondaryCamera", message: "Secondary Camera can't be empty!\n"))
        }
        if memory.isEmpty {
            brokenRules.append(BrokenRule(propertyName: "memory", message: "Memory can't be empty!\n"))
        }
    }
}

