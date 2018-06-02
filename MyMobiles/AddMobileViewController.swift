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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var batteryLabel: UILabel!
    @IBOutlet weak var batteryTextField: UITextField!
    @IBOutlet weak var primaryCameraLabel: UILabel!
    @IBOutlet weak var primaryCameraTextfield: UITextField!
    @IBOutlet weak var secondaryCameraLabel: UILabel!
    @IBOutlet weak var secondaryCameraTextField: UITextField!
    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var memoryTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        
        _ = MobileDetailViewModel(name: nameTextField.text!, model: nameTextField.text!, cost: Int(costTextField.text!)!, color: colorTextField.text!, battery: Int(batteryTextField.text!)!, primaryCamera: primaryCameraTextfield.text!, secondaryCamera: secondaryCameraTextField.text!, memory: memoryTextField.text!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
