//
//  SecondViewController.swift
//  boostcouse02-iOS
//
//  Created by 차요셉 on 09/12/2019.
//  Copyright © 2019 차요셉. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordTextField2: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var textField: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled=false
    }
    
    @IBAction func touchTapgesture(_ sender: Any) {
        self.view.endEditing(true)
        
        // Done 버튼 활성화 조건
        if imageView.accessibilityActivate() == true && idTextField.text! != ""&&passwordTextField.text! != ""&&passwordTextField2.text! != ""&&textField.text! != "" {
            if (passwordTextField.text!==passwordTextField2.text!) {
                doneButton.isEnabled=true
            }
        } else { doneButton.isEnabled=false }
        
      
        
        
    }
    
    // MARK: touchUpDoneButton
    @IBAction func touchUpDoneButton(_ sender: Any) {
        UserInformation.shared.id=idTextField.text!
        if (passwordTextField.text!==passwordTextField2.text!) {
        
            UserInformation.shared.password=passwordTextField.text!
        
        }
    }
}
