//
//  MixValidationViewController.swift
//  Validator
//
//  Created by nitin bhatia on 1/17/18.
//  Copyright © 2018 nitin bhatia. All rights reserved.
//

import UIKit

class MixValidationViewController: UIViewController,ValidationDelegate {
   
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    
    @IBOutlet weak var lblFullNameError: UILabel!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var lblConfirmEmailError: UILabel!
    @IBOutlet weak var lblPhoneError: UILabel!
    @IBOutlet weak var lblZipCodeError: UILabel!
    
    let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""
            if let textField = validationRule.field as? UITextField {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
                
            }
        }, error:{ (validationError) -> Void in
            print("error")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
            validationError.errorLabel?.textColor = UIColor.red
            validationError.errorLabel?.sizeToFit()
            if let textField = validationError.field as? UITextField {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
                
            }
        })
        
        validator.registerField(txtFullName, errorLabel: lblFullNameError, rules: [RequiredRule(),FullNameRule()])
        validator.registerField(txtEmail, errorLabel: lblEmailError, rules: [RequiredRule(),EmailRule()])
        validator.registerField(txtConfirmEmail, errorLabel: lblConfirmEmailError, rules: [RequiredRule(),ConfirmationRule(confirmField: txtEmail)])
        validator.registerField(txtPhone, errorLabel: lblPhoneError, rules: [RequiredRule(),MaxLengthRule(length: 12),PhoneNumberRule()])
        validator.registerField(txtZip, errorLabel: lblZipCodeError, rules: [RequiredRule(),ZipCodeRule()])




        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Validate(_ sender: Any) {
        validator.validate(self)
    }
    
    func validationSuccessful() {
        print("success")
        let alert = UIAlertController(title: "Success", message: "You are validated!", preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("failed")
    }

}
