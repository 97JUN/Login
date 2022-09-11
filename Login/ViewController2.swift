//
//  ViewController2.swift
//  회원가입
//
//  Created by 쭌이 on 2022/08/06.
//

import UIKit

class ViewController2: UIViewController,UIGestureRecognizerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate,UITextFieldDelegate {
    
    let imagePicker = UIImagePickerController()
    
    //MARK: IBOutlet
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var IdtextField: UITextField!
    
    @IBOutlet weak var pwTextfield: UITextField!
    
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    @IBOutlet weak var introduceText: UITextView!
    
    @IBOutlet weak var goToDate: UIButton!
    
    
    @objc func pickImage(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToDate.isEnabled = false
//        goToDate.isUserInteractionEnabled = false
//        goToDate.setTitleColor(.gray, for: .normal)
        
        self.profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.pickImage(_:))))
        
    
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        profileImage.isUserInteractionEnabled = true
                
    }
    
    
    @IBAction func returnToVc(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    //다음버튼을 눌렀을때 싱글턴에 값을 넣어준다.
    @IBAction func goToDate(_ sender: UIButton) {
        
        UserInfo.shared.id = IdtextField.text
        UserInfo.shared.password = pwTextfield.text
        UserInfo.shared.check = pwCheckTextField.text
        UserInfo.shared.text = introduceText.text
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        if let newImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImage.image = newImage
        }else if let newImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImage.image = newImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
   
    @IBAction func idEditChanged(_ sender: UITextField) {
        



        if check() && !(IdtextField.text?.isEmpty ?? true) && !(pwTextfield.text?.isEmpty ?? true)
        && !(pwCheckTextField.text?.isEmpty ?? true)
        {
            
            goToDate.isEnabled = true
        }else {
            goToDate.isEnabled = false
        }
      

    }
    func check () -> Bool {
        if pwTextfield.text == pwCheckTextField.text {
            return true
        }else {
            return false
        }
    }
    

    }
    
  

