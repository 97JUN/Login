//
//  ViewController3.swift
//  회원가입
//
//  Created by 쭌이 on 2022/08/06.
//

import UIKit

class ViewController3: UIViewController,UITextViewDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var signBtn: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        signBtn.isEnabled = false
      
        
    
    }
    
    @IBAction func previous(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        UserInfo.shared.phone = phoneNumber.text
        UserInfo.shared.date = dateLabel.text
      
    }
   
    

    @IBAction func phoneNumberCheck(_ sender: UITextField) {
      
        if !(phoneNumber.text?.isEmpty ?? true) && !(dateLabel.text?.isEmpty ?? true) {
            signBtn.isEnabled = true
        }else {
            signBtn.isEnabled = false
        }
        
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateString
    
    }
    
    
}
