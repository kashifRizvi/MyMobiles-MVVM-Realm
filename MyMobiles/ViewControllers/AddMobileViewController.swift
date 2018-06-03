//
//  AddMobileViewController.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 01/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import UIKit

class AddMobileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: BindingTextField! {
        didSet {
            nameTextField.bind { self.mobileDetailViewModel.name = $0 }
        }
    }
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorTextField: BindingTextField! {
        didSet {
            colorTextField.bind { self.mobileDetailViewModel.color = $0 }
        }
    }
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var costTextField: BindingTextField! {
        didSet {
            costTextField.bind { self.mobileDetailViewModel.cost = $0 }
        }
    }
    @IBOutlet weak var batteryLabel: UILabel!
    @IBOutlet weak var batteryTextField: BindingTextField! {
        didSet {
            batteryTextField.bind { self.mobileDetailViewModel.battery = $0 }
        }
    }
    @IBOutlet weak var primaryCameraLabel: UILabel!
    @IBOutlet weak var primaryCameraTextfield: BindingTextField! {
        didSet {
            primaryCameraTextfield.bind { self.mobileDetailViewModel.primaryCamera = $0 }
        }
    }
    @IBOutlet weak var secondaryCameraLabel: UILabel!
    @IBOutlet weak var secondaryCameraTextField: BindingTextField! {
        didSet {
            secondaryCameraTextField.bind { self.mobileDetailViewModel.secondaryCamera = $0 }
        }
    }
    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var memoryTextField: BindingTextField! {
        didSet {
            memoryTextField.bind { self.mobileDetailViewModel.memory = $0 }
        }
    }
    @IBOutlet weak var saveButton: UIButton!
    
    private var isMenuOpen: Bool = false
    private var menuView: MenuView!
    
    private var mobileDetailViewModel: MobileDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView = MenuView()
        view.addSubview(menuView)
        mobileDetailViewModel = MobileDetailViewModel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(menuTapped(_:)))
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        if mobileDetailViewModel.isValid {
            mobileDetailViewModel.saveMobile()
        }
        else {
            var errorMessage = ""
            _ = mobileDetailViewModel.brokenRules.map { errorMessage += $0.message }
            let alertController = UIAlertController(title: "Validation Failed", message: errorMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func menuTapped(_ sender: UIButton) {
        menuView.shouldShow = !menuView.shouldShow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
