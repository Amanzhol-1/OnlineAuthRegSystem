//
//  RegViewController.swift
//  iOSMessengerOnline
//
//  Created by Amanzhol on 01.07.2024.
//

import UIKit

class RegViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    var checkField = CheckField.shared
    var service = Service.shared
    
    @IBOutlet weak var mainView: UIView!
    
    var tapGest: UITapGestureRecognizer?
    
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var repeatPasswordView: UIView!
    @IBOutlet weak var repeatPasswordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
    
    @IBAction func closeVC(_ sender: Any) {
        delegate.closeVC()
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    @IBAction func regBtnClick(_ sender: Any) {
        if checkField.validField(emailView, emailField), checkField.validField(passwordView, passwordField){
            if (passwordField.text == repeatPasswordField.text) {
                service.createNewUser(LoginField(email: emailField.text!, password: passwordField.text!)) { [weak self]code in
                    switch code.code {
                    case 0:
                        print("Ошибка рега")
                    case 1:
                        self?.service.confirmEmail()
                        let alert = UIAlertController(title: "You've been registered", message: "Success", preferredStyle: .alert)
                        let okBtn = UIAlertAction(title: "Complete", style: .default) { _ in
                            self?.delegate.closeVC()
                        }
                        alert.addAction(okBtn)
                        self?.present(alert, animated: true)
                    default:
                        print("???")
                    }
                }
            } else {
                print("все плохо")
            }
        }
    }
    
}
