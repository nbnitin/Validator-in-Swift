//
//  ViewController.swift
//  Validator
//
//  Created by nitin bhatia on 1/17/18.
//  Copyright © 2018 nitin bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ValidationDelegate {

    @IBOutlet weak var txtCheckInput: UITextField!
    let validator = Validator()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        validator.registerField(txtCheckInput, errorLabel: nil, rules: [MinLength()])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCheck(_ sender: Any) {
      //  validator.validate(self)
        validator.validateField(txtCheckInput, callback:  {(ValidationError) in
            if(ValidationError?.errorMessage == nil){
                validationSuccessful()
            } else {
                let alertController = UIAlertController(title: "Error!!", message: "Text Check Input \(ValidationError!.errorMessage)", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Got It", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
    func validationSuccessful() {
        print("success")
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
       print("failed")

        for i in validator.errors{
            let txt = i.value.field
            print(txt)
            print(i.value.errorMessage)
        }
    }
    
}

