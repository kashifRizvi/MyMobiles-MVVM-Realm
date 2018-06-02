//
//  MobileListViewModel.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import RealmSwift

class MobileListViewModel {
    
    private (set) var mobileDetailViewModels :[MobileDetailViewModel] = [MobileDetailViewModel]()
    
    
    private var realm: Realm!
    
    init(completion :@escaping () -> ()) {
        
        realm = try! Realm()
        fetchData()
            DispatchQueue.main.async {
                completion()
            }
        }
    
    private func fetchData() {
        mobileDetailViewModels = realm.objects(Mobile.self).map(MobileDetailViewModel.init)
    }
    
    func mobileAt(index: Int) -> MobileDetailViewModel {
        return mobileDetailViewModels[index]
    }
}
