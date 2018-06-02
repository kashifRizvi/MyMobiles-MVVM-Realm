//
//  MenuView.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 02/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import UIKit

class MenuView: UIView {

    var toOpen: Bool = false {
        didSet {
            animateView()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        loadNib()
        layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadNib() {
        let nib = UINib(nibName: String(describing: MenuView.self), bundle: Bundle(for: type(of: self)))
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    override func layoutSubviews() {
        frame = CGRect(x: UIScreen.main.bounds.width - 150, y: -300, width: 150, height: 300)
    }
    
    override func awakeFromNib() {
        layoutIfNeeded()
    }
    
    private func animateView() {
        layoutIfNeeded()
        if toOpen {
            UIView.animate(withDuration: 1.4) {
                self.frame.origin.y = 0
            }
        }
        else {
            UIView.animate(withDuration: 1) {
                self.frame.origin.y = -self.frame.height
            }
        }
    }
}
