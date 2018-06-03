//
//  MobileDetailViewModelTests.swift
//  MyMobilesTests
//
//  Created by Kashif Rizvi on 03/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import XCTest
@testable import MyMobiles

class MobileDetailViewModelTests: XCTestCase {
    
    func testSuccessfulInit() {
        
        XCTAssertNotNil(MobileDetailViewModel.init(mobile: Mobile.with()))
        XCTAssertEqual(MobileDetailViewModel.init(mobile: Mobile.with(name: "New", model: "wefberf", cost: 2342, color: "234234", battery: 1234, primaryCamera: "werwef", secondaryCamera: "wefdewfhb", memory: "wekfhbef")).name, "New")
    }
    
}

class MockDataService: DataService {

}
