//
//  SignUpExtraViewController.swift
//  SignUp
//
//  Created by 서시언 on 2021/08/13.
//


import UIKit

class SignUpExtraViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var phoneNumTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var joinButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpPrevButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpJoinButton(_ sender: UIButton){
        UserInformation.shared.phoneNum = phoneNumTextField.text
        UserInformation.shared.birth = dateLabel.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
    }
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value change")
        
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if(phoneNumTextField.hasText && phoneNumTextField.text!.count == 11 ){
            joinButton.isEnabled = true
        }
        else{
            joinButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        joinButton.isEnabled = false
        joinButton.setTitleColor(.systemGray2, for: .disabled)
        
        phoneNumTextField.delegate = self

    }


}
