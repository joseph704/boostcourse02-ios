//
//  SecondViewController.swift
//  boostcouse02-iOS
//
//  Created by 차요셉 on 09/12/2019.
//  Copyright © 2019 차요셉. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker:UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    
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
        let tapGestureView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        let tapGestureImageView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapImageView(_:)))
        
        self.imageView.addGestureRecognizer(tapGestureImageView)
        self.view.addGestureRecognizer(tapGestureView)
        
        
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
        // Done 버튼 활성화 조건
        if imageView.accessibilityActivate() == true && idTextField.text! != ""&&passwordTextField.text! != ""&&passwordTextField2.text! != ""&&textField.text! != "" {
            if (passwordTextField.text!==passwordTextField2.text!) {
                doneButton.isEnabled=true
            }
        } else { doneButton.isEnabled=false }
    }
    
    
    @IBAction func tapImageView(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func touchUpDoneButton(_ sender: Any) {
        UserInformation.shared.id=idTextField.text!
        UserInformation.shared.password=passwordTextField.text!
        UserInformation.shared.text=textField.text!
    }
    
    @IBAction func touchUpCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
