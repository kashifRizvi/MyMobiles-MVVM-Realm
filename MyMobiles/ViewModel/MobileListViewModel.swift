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
    
    init(completion :@escaping () -> ()) {
            fetchData()
            DispatchQueue.main.async {
                completion()
            }
        }
    
    private func fetchData() {
        mobileDetailViewModels = DataService().fetchMobiles().map(MobileDetailViewModel.init)
    }
    
    func mobileAt(index: Int) -> MobileDetailViewModel {
        return mobileDetailViewModels[index]
    }
    
    func mobileUpdateAt(index: Int) -> MobileDetailViewModel {
        fetchData()
        return mobileDetailViewModels[index]
    }
    
    func deleteMobile(index: Int) {
        DataService().deleteObject(with: mobileAt(index: index).name)
        fetchData()
    }
}
