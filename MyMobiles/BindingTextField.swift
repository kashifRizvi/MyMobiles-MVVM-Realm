//
//  File.swift
//  MyMobiles
//
//  Created by Kashif Rizvi on 03/06/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    
    func bind(callback :@escaping (String) -> ()) {
        
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        
        self.textChanged(textField.text!)
    }
    
}
