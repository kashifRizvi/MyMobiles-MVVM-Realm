//
//  MockMobile.swift
//  MyMobilesTests
//
//  Created by Kashif Rizvi on 03/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation

extension Mobile {
    
    static func with(name: String = "new", model: String = "model", cost: Int = 123, color: String = "werw", battery: Int = 2423, primaryCamera: String = "weff", secondaryCamera: String = "wefewf", memory: String = "wfefef234") -> Mobile {
        
        return Mobile(name: name, model: model, cost: cost, color: color, battery: battery, primaryCamera: primaryCamera, secondaryCamera: secondaryCamera, memory: memory)
    }
}
