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
    
    
    
    override func viewDidLoad() {
        // Datefommater 설정
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        super.viewDidLoad()
        // 생년월일 기본값을 현재날짜로 설정
        myView.text = dateformatter.string(from: pickerView.date)
        
    }
    
    // DatePicker 액션 메소드
    @IBAction func changeDatePikcer(_ sender: Any) {
        pickerView.addTarget(self, action: #selector(changed), for: .valueChanged)

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
