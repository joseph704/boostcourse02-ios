//
//  ThirdViewController.swift
//  boostcouse02-iOS
//
//  Created by 차요셉 on 10/12/2019.
//  Copyright © 2019 차요셉. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBOutlet weak var myView: UILabel!
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    
    override func viewDidLoad() {
        // Datefommater 설정
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        super.viewDidLoad()
        // 생년월일 기본값을 현재날짜로 설정
        myView.text = dateformatter.string(from: pickerView.date)
        
    }
    // 취소 버튼 클릭시 action method
    @IBAction func cancelButtonClicked(_ sender: Any) {
        // 첫 화면으로 이동
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // 이전 버튼 클릭시 action method
    @IBAction func beforeButtonClicked(_ sender: Any) {
        // 이전 화면으로 이동
        self.dismiss(animated: true, completion: nil)
    }
    
    // 가입 버튼 클릭시 action method
    @IBAction func signupButtonClicked(_ sender: Any) {
        // 싱클턴 클래스 메소드에 삽입
        UserInformation.shared.birth=myView.text
        UserInformation.shared.phonenumber=phoneNumber.text
        // 첫화면으로 이동
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // DatePicker 액션 메소드
    @IBAction func changeDatePikcer(_ sender: Any) {
        pickerView.addTarget(self, action: #selector(changed), for: .valueChanged)

    }
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
        
    }
    
    // pickerView action 메소드
    @objc func changed() {
        // Datefommater 설정
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        // pickerView를 통해 선택한 날짜 String으로 포매팅
        let date = dateformatter.string(from: pickerView.date)
        // 포매팅한 값을 myView 라벨에 대입
        myView.text = date
        
        // 전화번호 textView가 채워졌을 시
        if textView.text != "" {
            signupButton.isEnabled = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
