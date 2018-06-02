//
//  MobileDetailCell.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import UIKit

class MobileDetailCell: UITableViewCell {
    
    @IBOutlet weak var nameModelLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var primaryCameraLabel: UILabel!
    @IBOutlet weak var secondaryCameraLabel: UILabel!
    @IBOutlet weak var batteryLabel: UILabel!
    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var otherFeatureView: UIStackView!
    var otherFeatureShown: Bool = false {
        didSet {
            otherFeatureView.isHidden = !otherFeatureShown
            moreButton.setTitle(otherFeatureShown ? "less" : "more", for: .normal)
        }
    }
    var delegate: RowUpdateDelegate!
    @IBOutlet weak var moreButton: UIButton!
        
    @IBAction func moreButtonTapped(_ sender: UIButton) {
        otherFeatureShown = !otherFeatureShown
        delegate.reloadCellFor(cell: self, showOtherFeatures: otherFeatureShown)
    }
}
