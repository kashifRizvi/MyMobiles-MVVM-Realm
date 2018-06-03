//
//  MobileListViewController.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 01/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import UIKit
import RealmSwift

protocol RowUpdateDelegate {
    func reloadCellFor(cell: UITableViewCell, showOtherFeatures: Bool)
}

class MobileListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RowUpdateDelegate {
    

    private var mobileListViewModel: MobileListViewModel!
    
    @IBOutlet weak var mobileListTableView: UITableView!
    
    private var isMenuOpen: Bool = false
    private var menuView: MenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileListViewModel = MobileListViewModel() {
            self.mobileListTableView.reloadData()
        }
        menuView = MenuView()
        view.addSubview(menuView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(menuTapped(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTapped(_:)))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mobileListViewModel != nil {
            return mobileListViewModel.mobileDetailViewModels.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mobileListCellId", for: indexPath) as! MobileDetailCell
        let mobileDetailViewModel = mobileListViewModel.mobileAt(index: indexPath.row)
        cell.delegate = self
        cell.batteryLabel.text = mobileDetailViewModel.battery
        cell.colorLabel.text = mobileDetailViewModel.color
        cell.costLabel.text = mobileDetailViewModel.cost
        cell.memoryLabel.text = mobileDetailViewModel.memory
        cell.nameModelLabel.text = mobileDetailViewModel.name
        cell.primaryCameraLabel.text = mobileDetailViewModel.primaryCamera
        cell.secondaryCameraLabel.text = mobileDetailViewModel.secondaryCamera
        cell.otherFeatureShown = mobileDetailViewModel.showOtherFeatures
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mobileListViewModel.deleteMobile(index: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = mobileListViewModel.mobileAt(index: sourceIndexPath.row)
        mobileListViewModel.mobileDetailViewModels.remove(at: sourceIndexPath.row)
        mobileListViewModel.mobileDetailViewModels.insert(item, at: destinationIndexPath.row)
        
    }
    
    @objc func editTapped(_ sender: UIBarButtonItem) {
        mobileListTableView.isEditing = !mobileListTableView.isEditing
        mobileListTableView.isEditing ? (sender.title = "Done") : (sender.title = "Edit")
    }
    
    @objc func menuTapped(_ sender: UIButton) {
        menuView.shouldShow = !menuView.shouldShow
    }
    
    func reloadCellFor(cell: UITableViewCell, showOtherFeatures: Bool) {
        if let indexPath = mobileListTableView.indexPath(for: cell) {
            mobileListViewModel.mobileAt(index: indexPath.row).showOtherFeatures = showOtherFeatures
            mobileListTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
