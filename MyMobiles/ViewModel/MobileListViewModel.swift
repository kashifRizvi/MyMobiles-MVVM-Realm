//
//  MobileListViewModel.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataServiceDelegate {
    func dataDidChange()
}

class MobileListViewModel: DataServiceDelegate {
    
    var mobileDetailViewModels :[MobileDetailViewModel] = [MobileDetailViewModel]()
    private var completion: (() -> ())?
    private var dataService = DataService.sharedInstance
    
    init(completion : (() -> ())? = nil) {
        self.completion = completion
        dataService.delegate = self
        fetchData()
    }
    
    private func fetchData() {
        mobileDetailViewModels = DataService.sharedInstance.fetchMobiles().map(MobileDetailViewModel.init)
        DispatchQueue.main.async {
            self.completion?()
        }
    }
    
    func mobileAt(index: Int) -> MobileDetailViewModel {
        return mobileDetailViewModels[index]
    }
    
    func deleteMobile(index: Int) {
        DataService.sharedInstance.deleteObject(with: mobileAt(index: index).name)
    }
    
    func dataDidChange() {
        fetchData()
    }
}
