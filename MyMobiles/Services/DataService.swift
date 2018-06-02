//
//  DataService.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import RealmSwift

class DataService {
    
    private var realm: Realm!
    
    init() {
        realm = try! Realm()
    }
    
    func fetchMobiles() -> Results<Mobile> {
        return realm.objects(Mobile.self)
    }
    
    func writeObjects(completion: () -> ()) {
        
    }
}
