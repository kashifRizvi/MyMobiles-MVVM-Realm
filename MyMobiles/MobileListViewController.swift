//
//  MobileListViewController.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 01/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import UIKit

class MobileListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var mobileListViewModel: MobileListViewModel!
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var mobileListTableView: UITableView!
    
    private var isMenuOpen: Bool = false
    private var menuView: MenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileListViewModel = MobileListViewModel() {
            self.mobileListTableView.reloadData()
        }
        
        mobileListTableView.delegate = self
        mobileListTableView.dataSource = self
        
        menuView = MenuView()
        view.addSubview(menuView)
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
        
        cell.batteryLabel.text = String(mobileDetailViewModel.battery)
        cell.colorLabel.text = mobileDetailViewModel.color
        cell.costLabel.text = String(mobileDetailViewModel.cost)
        cell.memoryLabel.text = mobileDetailViewModel.memory
        cell.nameModelLabel.text = String("\(mobileDetailViewModel.name), \(mobileDetailViewModel.model)")
        cell.primaryCameraLabel.text = mobileDetailViewModel.primaryCamera
        cell.secondaryCameraLabel.text = mobileDetailViewModel.secondaryCamera
        
        return cell
    }
    
    @IBAction func menuTapped(_ sender: UIButton) {
        menuView.toOpen = !menuView.toOpen
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
