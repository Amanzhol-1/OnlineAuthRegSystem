//
//  AuthViewController.swift
//  iOSMessengerOnline
//
//  Created by Amanzhol on 01.07.2024.
//

import UIKit

class AuthViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    var service = Service.shared
    var checkField = CheckField.shared
    var userDefault = UserDefaults.standard
    
    var tapGest: UITapGestureRecognizer?
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    @IBAction func clickAuthBtn(_ sender: Any) {
        if checkField.validField(emailView, emailField),
           checkField.validField(passwordView, passwordField) {
            let authData = LoginField(email: emailField.text!, password: passwordField.text!)
            service.authInApp(authData) { [weak self] respnce in
                switch respnce {
                case .success:
                    self?.userDefault.set(true, forKey: "isLogin")
                    self?.delegate.startApp()
                    self?.delegate.closeVC()
                case .noVerify:
                    let alert = self?.alertAction("Error", "You haven't verified your e-mail address, a link has been sent to your e-mail")
                    let verefyBtn = UIAlertAction(title: "Ok", style: .cancel)
                    alert?.addAction(verefyBtn)
                    self?.present(alert!, animated: true)
                case .error:
                    let alert = self?.alertAction("Error", "The data is not correct")
                    let verefyBtn = UIAlertAction(title: "Ok", style: .cancel)
                    alert?.addAction(verefyBtn)
                    self?.present(alert!, animated: true)
                }
            }
        }
        else {
            let alert = self.alertAction("Error", "Check the data entered")
            let verefyBtn = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(verefyBtn)
            self.present(alert, animated: true)
        }
    }
    
    func alertAction(_ header: String?, _ message: String?) -> UIAlertController {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        return alert
    }
    
    @IBAction func closeVC(_ sender: Any) {
        
        delegate.closeVC()
    }
    
    @IBAction func fargotPassword(_ sender: Any) {
        
    }
    
    //сделать кнопку нет аккаунта
}
