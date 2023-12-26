//
//  RegisterViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var realNameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField1: UITextField!
    @IBOutlet weak var passwordTextField2: UITextField!
    
    enum UserTypr {
        case coach
        case company
        case landholder
    }
    
    var userType: UserTypr = .coach

    override func viewDidLoad() {
        super.viewDidLoad()

        // background image setting
        let backgroundImage = UIImage(named: "FNbackground")
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        configureView()
    }
    
    @IBAction func goLoginClick(_ sender: Any) {
        navigateToLoginViewController()
    }
    
    @IBAction func changeRoleClick(_ sender: Any) {
        let registerRoleChooseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginChooseViewController") as! LoginChooseViewController
        
        registerRoleChooseVC.viewType = .register
        registerRoleChooseVC.modalPresentationStyle = .fullScreen
        self.present(registerRoleChooseVC, animated: false)
    }
    
    @IBAction func submitClick(_ sender: Any) {
        if let realName = realNameTextField.text,
           let nickname = nicknameTextField.text,
           let password1 = passwordTextField1.text,
           let password2 = passwordTextField2.text,
           !realName.isEmpty && !nickname.isEmpty && !password1.isEmpty && !password2.isEmpty {
            let alartVC = UIAlertController(title: "Mssage", message: "註冊成功，請登入！", preferredStyle: UIAlertController.Style.alert)
  
            let okButton = UIAlertAction(title: "確認", style: .default) { _ in
                    self.navigateToLoginViewController()
                }
            
            alartVC.addAction(okButton)
            self.present(alartVC, animated: true, completion: nil)
        } else {
            let alartVC = UIAlertController(title: "Error", message: "不可有未填寫的空格，請填寫完整資料！", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "確認", style: UIAlertAction.Style.default, handler: nil)
            
            alartVC.addAction(okButton)
            self.present(alartVC, animated: true, completion: nil)
        }
    }
    
    func configureView() {
        switch userType {
        case .coach:
            registerLabel.text = "教練註冊"
            imageView.image = UIImage(named: "coach")!
            realNameTextField.placeholder = "Enter real name"
            nicknameTextField.placeholder = "Enter user name"
        case .company:
            registerLabel.text = "企業註冊"
            imageView.image = UIImage(named: "company")!
            realNameTextField.placeholder = "Enter company name"
            nicknameTextField.placeholder = "Enter company nickname"
        case .landholder:
            registerLabel.text = "地主註冊"
            imageView.image = UIImage(named: "place")!
            realNameTextField.placeholder = "Enter real name"
            nicknameTextField.placeholder = "Enter user name"
        }
    }
    
    func navigateToLoginViewController() {
        let loginChooseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginChooseViewController") as! LoginChooseViewController
        
        loginChooseVC.viewType = .login
        loginChooseVC.modalPresentationStyle = .fullScreen
        self.present(loginChooseVC, animated: false)
    }

}
