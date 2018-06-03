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
    
    var delegate: DataServiceDelegate?
    static var sharedInstance: DataService = DataService()
    
    private init() {
        realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func fetchMobiles() -> Results<Mobile> {
        return realm.objects(Mobile.self).sorted(byKeyPath: "date", ascending: true)
    }
    
    func saveMobile(object: Mobile) {
        try! realm.write {
            realm.add(object)
            print("Added object with name = \(object.name)")
            delegate?.dataDidChange()
        }
    }
    
    func deleteObject(with name: String) {
        try! realm.write {
            realm.delete(realm.objects(Mobile.self).filter("name == %@", name))
            delegate?.dataDidChange()
        }
    }
}
