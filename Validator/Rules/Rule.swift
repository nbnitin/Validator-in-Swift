//
//  Rule.swift
//  Validator
//
//  Created by nitin bhatia on 1/17/18.
//  Copyright © 2018 nitin bhatia. All rights reserved.
//

import Foundation

public protocol Rule{
    /**
     Validates text of a field.
     
     - parameter value: String of text to be validated.
     - returns: Boolean value. True if validation is successful; False if validation fails.
     */
    func validate(_ value: String) -> Bool
    /**
     Displays error message of a field that has failed validation.
     
     - returns: String of error message.
     */
    func errorMessage() -> String
}

