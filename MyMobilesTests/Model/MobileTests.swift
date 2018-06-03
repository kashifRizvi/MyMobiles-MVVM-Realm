//
//  MobileTests.swift
//  MyMobilesTests
//
//  Created by Kashif Rizvi on 03/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import XCTest
@testable import MyMobiles

class MobileTests: XCTestCase {
    
    func testSuccessfulInit() {
        
        XCTAssertNotNil(Mobile.init(name: "new", model: "model", cost: 123, color: "werw", battery: 2423, primaryCamera: "weff", secondaryCamera: "wefewf", memory: "wfefef234"))
        
        XCTAssertEqual(Mobile.init(name: "new", model: "model", cost: 123, color: "werw", battery: 2423, primaryCamera: "weff", secondaryCamera: "wefewf", memory: "wfefef234").name, "new")
    }
}
