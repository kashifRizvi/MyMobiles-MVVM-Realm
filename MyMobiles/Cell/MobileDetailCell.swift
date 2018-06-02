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
    private var otherFeatureShown: Bool = false {
        didSet {
            otherFeatureView.isHidden = !otherFeatureShown
            delegate.reloadCellFor(cell: self)
        }
    }
    var delegate: RowUpdateDelegate!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {
        if otherFeatureShown {
            moreButton.setTitle("more", for: .normal)
        }
        else {
            moreButton.setTitle("less", for: .normal)
        }
        otherFeatureShown = !otherFeatureShown
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        otherFeatureView.isHidden = true
        moreButton.setTitle("more", for: .normal)
    }

}
