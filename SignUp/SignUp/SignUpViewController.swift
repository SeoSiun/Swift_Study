//
//  SignUpViewController.swift
//  SignUp
//
//  Created by 서시언 on 2021/08/12.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkTextField: UITextField!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var textView: UITextView!

    @IBAction func touchUpCancelButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSelectImageButton() {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.userImageView.image = editedImage
            self.dismiss(animated: true, completion: nil)
        }
        setButtonState()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setButtonState()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        setButtonState()
    }
    
    func setButtonState(){
        if(passwordTextField.text == checkTextField.text && idTextField.hasText && textView.hasText && userImageView.image != nil && passwordTextField.hasText){
            nextButton.isEnabled = true
        }
        else{
            nextButton.isEnabled = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextButton.isEnabled = false
        nextButton.setTitleColor(.systemGray2, for: .disabled)
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        checkTextField.delegate = self
        textView.delegate = self
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(touchUpSelectImageButton))
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tapGestureRecognizer)
        
    }


}
