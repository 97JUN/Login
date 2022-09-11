//
//  ViewController.swift
//  회원가입
//
//  Created by 쭌이 on 2022/08/05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var IdTexfield: UITextField!    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.logInButton.isEnabled = false
        
        if let id = UserInfo.shared.id {
            self.IdTexfield.text = id
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    //키보드 내리기
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //키보드에서 done을 누르면 내려가기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if UserInfo.shared.id != nil {
            if UserInfo.shared.id! == IdTexfield.text! && UserInfo.shared.password! == passwordTextfield.text!{
                self.logInButton.isEnabled = false
                
                //                guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {
                //                    print("View controller not found")
                return
            }
            self.logInButton.isEnabled = true
        }else {
            let alert: UIAlertController = UIAlertController(title: "알림", message: "회원정보가 일치하지 않습니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction) -> Void in
                self.dismiss(animated: true)
            })
            alert.addAction(okAction)
            self.present(alert, animated: true,completion: nil)
        }
        
    }
    
}
    


