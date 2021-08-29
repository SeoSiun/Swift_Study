//
//  ViewController.swift
//  Alert
//
//  Created by 서시언 on 2021/08/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchUpShowAlertButton(_ sender: UIButton){
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style: UIAlertController.Style){
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed")})
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        // action의 위치는 alertController가 알아서 결정함.
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // handler를 따로 정의하면 반복작업에 유리
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in print("action pressed \(action.title ?? "")")}
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        // ERROR : Cancel은 반드시 하나만 있어야 함
//        let anotherAction : UIAlertAction
//        anotherAction = UIAlertAction(title: "Anthor", style: UIAlertAction.Style.cancel, handler: handler)
        
        let anotherAction : UIAlertAction
        anotherAction = UIAlertAction(title: "Anthor", style: UIAlertAction.Style.default, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        // action sheet는 textField가 있으면 에러
        alertController.addTextField(configurationHandler: {(field: UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
        })
        self.present(alertController, animated: true, completion: { print("Alert controller shown")})
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

