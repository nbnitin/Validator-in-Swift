//
//  Validatable.swift
//  Validator
//
//  Created by nitin bhatia on 1/17/18.
//  Copyright © 2018 nitin bhatia. All rights reserved.
//

import Foundation
import UIKit

public typealias ValidatableField = AnyObject & Validatable

public protocol Validatable {
    
    var validationText: String {
        get
    }
}

extension UITextField: Validatable {
    
    public var validationText: String {
        return text ?? ""
    }
}
