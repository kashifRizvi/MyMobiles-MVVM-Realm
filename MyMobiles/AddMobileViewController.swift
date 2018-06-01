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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
